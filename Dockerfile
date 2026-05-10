FROM nginx:alpine

# Remove config padrão
RUN rm /etc/nginx/conf.d/default.conf

# Copia arquivos estáticos
COPY index.html /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/
COPY images/ /usr/share/nginx/html/images/

# Config nginx simples
RUN echo 'server { listen 80; root /usr/share/nginx/html; location / { try_files $uri $uri/ =404; } }' > /etc/nginx/conf.d/default.conf

EXPOSE 80