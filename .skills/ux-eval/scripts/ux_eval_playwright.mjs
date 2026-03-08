import fs from 'node:fs/promises';
import path from 'node:path';

const [, , url, outputDir, deviceScope = 'both'] = process.argv;

if (!url || !outputDir) {
  console.error('Usage: node ux_eval_playwright.mjs <url> <output-dir> [desktop|mobile|both]');
  process.exit(1);
}

let chromium;
let devices;
try {
  ({ chromium, devices } = await import('playwright'));
} catch (error) {
  console.error('Playwright is not installed in this environment.');
  console.error('Install it in the target project or available toolchain before running ux-eval.');
  process.exit(1);
}

const runs = [];
if (deviceScope === 'desktop' || deviceScope === 'both') {
  runs.push({ name: 'desktop', viewport: { width: 1440, height: 1100 } });
}
if (deviceScope === 'mobile' || deviceScope === 'both') {
  runs.push({ name: 'mobile', device: devices['iPhone 13'] });
}

await fs.mkdir(outputDir, { recursive: true });

for (const run of runs) {
  const browser = await chromium.launch({ headless: true });
  const context = run.device
    ? await browser.newContext({ ...run.device })
    : await browser.newContext({ viewport: run.viewport });
  const page = await context.newPage();

  try {
    await page.goto(url, { waitUntil: 'networkidle', timeout: 45000 });
    await page.screenshot({ path: path.join(outputDir, `${run.name}-landing.png`), fullPage: true });

    const title = await page.title();
    const bodyText = await page.locator('body').innerText().catch(() => '');

    const summary = {
      url,
      device: run.name,
      title,
      captured_at: new Date().toISOString(),
      notes: [
        'Scaffold run only. A UX-review pass should continue by interacting through key user flows and capturing issue-specific screenshots.',
        'Use this artifact as initial evidence, not as the final review output.',
      ],
      body_text_excerpt: bodyText.slice(0, 2000),
    };

    await fs.writeFile(
      path.join(outputDir, `${run.name}-summary.json`),
      JSON.stringify(summary, null, 2),
      'utf8'
    );
  } finally {
    await context.close();
    await browser.close();
  }
}
