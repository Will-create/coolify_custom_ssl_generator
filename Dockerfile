FROM node:19-alpine
MAINTAINER louisbertson "louisbertson@gmail.com"


VOLUME /www/
WORKDIR /www/
RUN mkdir -p /www/bundles/
RUN apk add --no-cache certbot certbot-nginx


COPY index.js .
COPY config .
COPY package.json .
COPY ./--bundles--/app.bundle ./bundles/

RUN npm install
EXPOSE 3030

CMD [ "npm", "start" ]