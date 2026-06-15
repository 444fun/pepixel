
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PEPIXELCRAFT - Survival de Memes</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
  
  <style>
    html { scroll-behavior: smooth; }
    @import url('https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap');
    
    body {
      font-family: 'Press Start 2P', system-ui;
      image-rendering: pixelated;
    }
    
    .minecraft-bg {
      background-image: 
        linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)),
        url('https://i.imgur.com/4z5vX8k.png'); /* textura minecraft */
      background-size: cover;
    }

    .block {
      image-rendering: pixelated;
      transition: all 0.2s;
    }
    .block:hover {
      transform: translateY(-8px) scale(1.05);
      filter: brightness(1.2);
    }

    .title {
      text-shadow: 
        4px 4px 0 #000,
        -4px -4px 0 #000,
        4px -4px 0 #000,
        -4px 4px 0 #000;
    }
  </style>
</head>
<body id="top" class="bg-[#3C2F1E] text-[#E5E5E5] minecraft-bg min-h-screen">

  <!-- HEADER -->
  <header class="border-b-4 border-[#4CAF50] bg-[#2E2E2E] py-4 sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-6 flex items-center justify-between">
      <div class="flex items-center gap-4">
        <a href="index.html"><img src="assets/images/PEPIXELGOD.jpeg" alt="PEPIXEL" id="logo-img" class="w-12 h-12 object-cover rounded-full" onerror="this.style.display = 'none'; document.getElementById('logo-fallback').style.display = 'inline-block';" /></a>
        <span id="logo-fallback" class="text-5xl hidden">🧱</span>
        <div class="flex flex-col">
          <h1 class="text-4xl font-bold title text-[#FFEB3B]">PEPIXELCRAFT</h1>
          <div class="mt-1 flex items-center gap-3 text-sm">
            <span class="w-8 h-8 rounded-full bg-[#FFD54F] flex items-center justify-center text-black font-bold border-2 border-black">CA</span>
            <span class="text-[#A5D6A7]">Suprimento total: <strong class="text-[#FFEB3B]">1.000.000.000 PEPIXEL</strong></span>
          </div>
        </div>
      </div>
      <nav class="flex gap-6 text-sm">
        <a href="#top" class="bg-[#4CAF50] hover:bg-[#66BB6A] px-6 py-3 border-4 border-black text-black font-bold">INÍCIO</a>
        <a href="#gallery" class="bg-[#FFEB3B] hover:bg-[#FFEE58] px-6 py-3 border-4 border-black text-black font-bold">GALERIA</a>
        <a href="pepixel style index.html" target="_blank" rel="noopener noreferrer" class="bg-[#2196F3] hover:bg-[#42A5F5] px-6 py-3 border-4 border-black text-black font-bold">COMUNIDADE</a>
        <a href="CSSindex.html" target="_blank" rel="noopener noreferrer" class="bg-[#FF5722] hover:bg-[#FF7043] px-6 py-3 border-4 border-black text-black font-bold">CRAFTAR</a>
      </nav>
    </div>
  </header>

  <!-- HERO -->
  <section class="py-16 text-center border-b-8 border-[#4CAF50]">
    <h2 class="text-6xl font-bold title text-[#FFEB3B] mb-6">PEPIXEL</h2>
    <p class="text-2xl text-[#A5D6A7]">Sobrevivendo com estilo e bigode</p>
  </section>

  <!-- GALERIA -->
  <main class="max-w-7xl mx-auto px-6 py-12">
    <h3 class="text-3xl font-bold mb-10 text-center title text-[#FFEB3B]">GALERIA DE MEMES</h3>
    
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8" id="gallery">
      <!-- Primeiro cartão (imagem estática solicitada) -->
      <div class="block bg-[#2E2E2E] border-4 border-[#4CAF50] overflow-hidden">
          <div class="relative">
            <a href="assets/images/meme1.svg" target="_blank" rel="noopener noreferrer"><img src="assets/images/meme1.svg" class="w-full h-auto block" alt="TRABALHANDO NO MC"></a>
          <div class="absolute top-3 right-3 bg-black/80 text-[#FFEB3B] text-xs px-3 py-1 border-2 border-[#FFEB3B]">LEGENDARY</div>
        </div>
        <div class="p-6">
          <h4 class="text-[#FFEB3B] font-bold text-xl mb-2">TRABALHANDO NO MC</h4>
          <p class="text-[#A5D6A7] text-sm">Level 100 de profissão</p>
          <div class="flex justify-between items-center mt-6 text-xs">
            <div> 9999</div>
            <div> 420</div>
            <div>♻️ CRAFTED</div>
          </div>
        </div>
      </div>
    </div>
  </main>

  <script>
    const memes = [
      { src: "assets/images/meme1.svg", title: "TRABALHANDO NO MC", desc: "Level 100 de profissão" },
      { src: "assets/images/meme2.svg", title: "CONTEMPLANDO O MUNDO", desc: "Pensando na próxima atualização" },
      { src: "assets/images/meme3.svg", title: "PEPIXEL CLASSIC", desc: "Versão 1.0" },
      { src: "assets/images/meme4.svg", title: "SONHO DE CONSUMO", desc: "Lamborghini ou Picareta?" },
      { src: "assets/images/meme5.svg", title: "EXPLORANDO O BIOMA", desc: "Andando de carro no mundo aberto" }
    ];

    const gallery = document.getElementById('gallery');

    // já há um cartão estático (meme1) — inserir os outros a partir do índice 1
    memes.slice(1).forEach(meme => {
      gallery.innerHTML += `
        <div class="block bg-[#2E2E2E] border-4 border-[#4CAF50] overflow-hidden">
          <div class="relative">
            <a href="${meme.src}" target="_blank" rel="noopener noreferrer"><img src="${meme.src}" class="w-full h-auto block" alt="${meme.title}"></a>
            <div class="absolute top-3 right-3 bg-black/80 text-[#FFEB3B] text-xs px-3 py-1 border-2 border-[#FFEB3B]">
              LEGENDARY
            </div>
          </div>
          <div class="p-6">
            <h4 class="text-[#FFEB3B] font-bold text-xl mb-2">${meme.title}</h4>
            <p class="text-[#A5D6A7] text-sm">${meme.desc}</p>
            
            <div class="flex justify-between items-center mt-6 text-xs">
              <div> 9999</div>
              <div> 420</div>
              <div>♻️ CRAFTED</div>
            </div>
          </div>
        </div>
      `;
    });
  </script>

  <!-- FOOTER -->
  <footer class="bg-black border-t-4 border-[#4CAF50] py-10 text-center">
    <p class="text-[#A5D6A7]">Made with  + 🧱 + ódio</p>
    <p class="text-xs mt-4 text-gray-500">PepixelCraft © 2026 - Sobrevivência garantida</p>
  </footer>
</body>
</html>