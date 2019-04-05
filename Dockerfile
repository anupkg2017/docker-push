FROM node:alpine as buider

WORKDIR '/app'

COPY package*.json ./

RUN npm install

COPY /Users/agopalakrishnan/DockerProdApp/frontend/ /app/

RUN npm build

FROM nginx
EXPOSE 80
COPY --from=buider /app/build /usr/share/nginx/html

