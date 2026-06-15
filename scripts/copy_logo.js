const fs = require("fs");
const src = "assets/images/PEPIXEL PERFIL.jpeg";
const dest = "assets/images/PEPIXELGOD.jpeg";

fs.copyFile(src, dest, (err) => {
  if (err) {
    console.error("Falha ao copiar:", err.message);
    process.exit(1);
  }
  console.log("Copiado:", dest);
});
