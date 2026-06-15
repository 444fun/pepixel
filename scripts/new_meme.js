const fs = require("fs").promises;
const path = require("path");

async function main() {
  const title = process.argv.slice(2).join(" ") || "NOVO MEME";
  const safe = title.replace(/[^a-zA-Z0-9-_]/g, "-").toLowerCase();
  const dir = path.join(__dirname, "..", "assets", "images");
  const file = path.join(dir, `${safe}.svg`);
  const content = `<?xml version="1.0" encoding="UTF-8"?>\n<svg xmlns="http://www.w3.org/2000/svg" width="800" height="600" viewBox="0 0 800 600">\n  <rect width="100%" height="100%" fill="#2E2E2E"/>\n  <rect x="20" y="20" width="760" height="560" fill="#144620" rx="8"/>\n  <text x="50%" y="50%" font-family="'Press Start 2P',monospace" font-size="28" fill="#FFEB3B" text-anchor="middle" dominant-baseline="middle">${title}</text>\n</svg>\n`;

  await fs.writeFile(file, content, "utf8");
  console.log("Arquivo criado:", file);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
