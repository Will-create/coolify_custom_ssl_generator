FUNC.generate_ssl = async function(domain) { 

    return new Promise((resolve, reject) => {
        if (!F.Fs.existsSync(CONF.cert_dirs || '/data/coolify/proxy/certs')) 
            F.Fs.mkdirSync(CONF.cert_dirs || '/data/coolify/proxy/certs', { recursive: true });

        console.log(`Generating SSL for ${domain}...`);

        SHELL(`certbot certonly --standalone --non-interactive --agree-tos --email ${CONF.email} -d ${domain}`, function(err, stdout, stderr) {
            if (err) {
                console.error(`Error generating SSL for ${domain}: ${err}`);
                resolve(0);
            } else {
                console.log(`SSL generated for ${domain}`);
                SHELL(`cp /etc/letsencrypt/live/${domain}/fullchain.pem ${CONF.cert_dirs}/${domain}.cert`,NOOP);
                SHELL(`cp /etc/letsencrypt/live/${domain}/privkey.pem ${CONF.cert_dirs}/${domain}.key`,NOOP);
                resolve(1);
            }
        });
    });

}
