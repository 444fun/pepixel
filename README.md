# PepixelCraft

Site estático simples com galeria de memes estilo Minecraft.

Como executar (recomendado):

1. Instale o Node.js (se ainda não tiver): https://nodejs.org/
2. No diretório do projeto, rode:

```powershell
npm install
npm start
```

3. Abra `http://localhost:8080` no navegador.

Alternativa rápida (sem instalar dependências):

```powershell
npx http-server -p 8080
```

Personalize as imagens editando `index.html` e substitua os links em `memes`.

Gerar PNGs e thumbnails das imagens SVG locais:

```powershell
npm install
npm run build-images
```

Criar um novo meme SVG a partir do terminal:

```powershell
npm run new-meme "TÍTULO DO MEME"
```

## Deploy

Preparado para publicar no domínio `pepixel.xyz`.

- Arquivo de domínio incluído: [CNAME](CNAME)
- Workflow do GitHub Actions incluído: [.github/workflows/gh-pages.yml](.github/workflows/gh-pages.yml)

Passos para publicar:

1. Faça push para a branch `main`. O workflow fará deploy para a branch `gh-pages`.
2. Configure o DNS do seu provedor para o domínio apex (`pepixel.xyz`) apontando para os seguintes endereços IP do GitHub Pages:

```
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
```

3. Aguarde a propagação do DNS (algumas horas) e verifique em `https://pepixel.xyz`.

Observação: se preferir usar um subdomínio (`www.pepixel.xyz`), crie um registro CNAME apontando para `your-github-username.github.io`.
