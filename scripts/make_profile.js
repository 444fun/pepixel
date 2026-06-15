const sharp = require("sharp");

sharp("assets/images/generated/meme1.png")
  .jpeg()
  .toFile("assets/images/pepixel-perfil.jpeg")
  .then(() => console.log("Perfil criado: assets/images/pepixel-perfil.jpeg"))
  .catch((err) => {
    console.error("Erro ao criar perfil:", err.message);
    process.exit(1);
  });
