const fs = require("fs");
const src = "assets/images/pepixel-perfil.jpeg";
const dest = "assets/images/PEPIXELGOD.jpeg";

fs.copyFile(src, dest, (err) => {
  if (err) {
    console.error("Falha ao copiar:", err.message);
    process.exit(1);
  }
  console.log("Copiado:", dest);
});
