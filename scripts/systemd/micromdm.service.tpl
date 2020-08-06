[Unit]
Description=micromdm
After=network.target

[Service]
User=root
ExecStart=/usr/local/bin/micromdm serve -server-url=https://${full_dns_record} -api-key=${micromdm_api_key} -filerepo /root/micromdm_repo -command-webhook-url=http://localhost:8000/webhook -tls-cert /etc/letsencrypt/live/${full_dns_record}/fullchain.pem -tls-key /etc/letsencrypt/live/${full_dns_record}/privkey.pem
[Install]
WantedBy=multi-user.target