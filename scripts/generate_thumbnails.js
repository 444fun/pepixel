const fs = require("fs").promises;
const path = require("path");
const sharp = require("sharp");

async function generate() {
  const dir = path.join(__dirname, "..", "assets", "images");
  const files = await fs.readdir(dir);
  await fs.mkdir(path.join(dir, "generated"), { recursive: true });

  for (const file of files) {
    if (!file.toLowerCase().endsWith(".svg")) continue;
    const name = path.parse(file).name;
    const svgPath = path.join(dir, file);
    const outPng = path.join(dir, "generated", `${name}.png`);
    const thumb = path.join(dir, "generated", `${name}-thumb.png`);

    try {
      const svgBuffer = await fs.readFile(svgPath);
      // gerar PNG em 800x600
      await sharp(svgBuffer)
        .resize(800, 600, { fit: "cover" })
        .png()
        .toFile(outPng);
      // gerar thumbnail 300x225
      await sharp(svgBuffer)
        .resize(300, 225, { fit: "cover" })
        .png()
        .toFile(thumb);
      console.log(`Gerado: ${outPng} e ${thumb}`);
    } catch (err) {
      console.error("Erro ao processar", svgPath, err.message);
    }
  }
}

generate().catch((err) => {
  console.error(err);
  process.exit(1);
});
