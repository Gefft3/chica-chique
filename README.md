# Landing Page de Laços Artesanais - Docker

## Estrutura
```
lacos-landing/
├── Dockerfile
├── docker-compose.yml
├── index.html
├── styles.css
└── images/  (opcional, para suas fotos)
```

## Setup Rápido

### 1. Certifique-se que tem Docker instalado
```bash
docker --version
docker-compose --version
```

### 2. Crie uma pasta para o projeto
```bash
mkdir chica_chique && cd chica_chique
```

### 3. Copie os arquivos nessa pasta
- Dockerfile
- docker-compose.yml
- index.html
- styles.css

### 4. Adicione suas imagens (opcional)
```bash
mkdir -p images
# Coloque seus PNGs/JPGs na pasta images/
```

### 5. Rode com docker-compose
```bash
docker-compose up --build
```

Acesse em `http://localhost:8080`

## Sem docker-compose (apenas Docker)

```bash
# Build
docker build -t lacos-landing .

# Run
docker run -p 8080:80 -v $(pwd)/index.html:/usr/share/nginx/html/index.html -v $(pwd)/styles.css:/usr/share/nginx/html/styles.css lacos-landing
```

## Customizar

### Cores
Edite as variáveis CSS em `styles.css` (linhas 1-10):
```css
--primary: #d4a574;        /* cor principal */
--primary-dark: #a67c52;   /* hover */
--accent: #c9a587;
--text-dark: #2d2d2d;
--bg-light: #faf8f3;
```

### Textos e Informações
Edite direto em `index.html`:
- Nomes das coleções (linha ~57)
- Descrições (linha ~60)
- Preços (linha ~62)
- Links de contato (linhas ~105-112)

### Adicionar Imagens
1. Coloque arquivo em `images/seu-laço.jpg`
2. Edite `index.html`, substitua os `<span class="product-icon">` por `<img src="images/seu-laço.jpg" alt="Nome">`

## Deploy

### Render / Railway
1. Coloque tudo em um repo Git (GitHub)
2. Conecte o repo no Render/Railway
3. Deixa fazer build automático

### VPS/Servidor próprio
```bash
docker-compose up -d
# Acesse via IP:8080 ou configure nginx reverse proxy na porta 80
```

## Parar o container
```bash
docker-compose down
```

## Troubleshooting

**Porta 8080 já em uso:**
```bash
docker-compose down
# Altere em docker-compose.yml: "8080:80" → "8081:80"
docker-compose up -d
```

**Ver logs:**
```bash
docker-compose logs -f
```

**Rebuildar sem cache:**
```bash
docker-compose up --build --no-cache
```