# Use an official Node.js runtime as a parent image
FROM node:20-bullseye

# Set working directory
WORKDIR /app

# Install Certbot and dependencies
RUN apt-get update && apt-get install -y \
    certbot \
    python3-certbot-nginx \
    curl \
    && apt-get clean

# Copy application files
COPY ./* .

# Install dependencies
RUN npm install

# Set environment variables
ENV DOMAIN=""
ENV EMAIL=""
ENV CERT_DIR="/data/coolify/proxy/certs"

# Expose the application port
EXPOSE 3030

# Command to run the app
CMD ["npm", "start"]
