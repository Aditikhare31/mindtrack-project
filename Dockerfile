FROM nginx:latest
COPY dist/ /usr/share/nginx/html
EXPOSE 3000
