FROM node:alpine as buider

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm build

FROM nginx
COPY --from=buider /app/build /usr/share/nginx/html

