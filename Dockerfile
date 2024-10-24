# Usar a imagem base do Nginx
FROM nginx:alpine

# Remover arquivos padrão do Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copiar os arquivos do site para o diretório padrão do Nginx
COPY . /usr/share/nginx/html

# Expor a porta 8080
EXPOSE 8081

# Modificar a configuração do Nginx para usar a porta 8080
RUN sed -i 's/listen       80;/listen       8080;/g' /etc/nginx/conf.d/default.conf

# Iniciar o Nginx
CMD ["nginx", "-g", "daemon off;"]
