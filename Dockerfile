FROM node:20-slim

WORKDIR /app

RUN apt-get update && apt-get install -y certbot && rm -rf /var/lib/apt/lists/*

COPY . .

RUN npm install --production

EXPOSE 3030

CMD ["node", "index.js"]
