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
COPY . /app

# Install dependencies
RUN npm install

# Set environment variables
ENV DOMAIN=${DOMAIN}
ENV EMAIL=${EMAIL}
ENV CERT_DIR=${CERT_DIR}

# Expose the application port
EXPOSE 3000

# Command to run the app
CMD ["node", "app.js"]
