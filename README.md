
# 🔒 Coolify Custom SSL Generator

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A simple web app to generate **custom SSL certificates** for your **Coolify** applications, using **Total.js v5** and **Certbot**.

👉 [GitHub Repo](https://github.com/Will-create/coolify_custom_ssl_generator)

---

## ✨ Features

- Generate SSL certificates easily from your browser
- Supports **domain** and **subdomain** validation
- Simple, beautiful interface with loading animations
- Asynchronous generation via Certbot
- Certificates are saved directly to your Coolify proxy certs directory
- Production-ready (PM2 recommended)

---

## 📦 Requirements

- **Node.js** v19 or higher
- **Certbot** installed and accessible via shell
- **PM2** for production usage (optional, but recommended):
  ```bash
  npm install -g pm2
  ```
- Linux/Unix system with access to ports 80/443

---

## 🚀 Installation

```bash
git clone https://github.com/Will-create/coolify_custom_ssl_generator.git
cd coolify_custom_ssl_generator
npm install
```

---

## ⚙️ Configuration

Edit the `/config` file to match your environment:

```bash
name          : Custom SSL Generator for Coolify Applications
cert_dirs     : /path/to/your/coolify/certs
email         : your@email.com
rename        : true
```

- **cert_dirs**: Path where generated certs will be copied (inside your Coolify proxy).
- **email**: Your email for Let's Encrypt registration.
- **rename**: Whether to automatically rename generated cert files.

---

## 🖥️ Usage

1. Run the app locally:
   ```bash
   node index.js
   ```
   Or better, with **PM2**:
   ```bash
   pm2 start index.js --name coolify-ssl-generator
   ```

2. Access the web interface:
   ```
   http://your-server-ip:3030
   ```

3. Enter a valid domain or subdomain (example: `sub.domain.com`) and click **Generate SSL**.

4. Certificates will be generated using **Certbot** and copied to the configured `cert_dirs`.

---

## 📋 Notes

- Ensure **Certbot** is installed (`sudo apt install certbot` on Debian/Ubuntu).
- Stop Nginx/Apache temporarily if using **standalone** Certbot mode.
- This app assumes port 80 is free during certificate generation.
- SSL generation is automatic, but you may want to manually reload your proxy (Coolify) after new certs are issued.

---

## 🤝 Contributing

Pull requests, ideas, and suggestions are welcome!  
Let's make Coolify deployment even smoother together.

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

# 🌟 Coolify Custom SSL Generator — Powered by Total.js 5

