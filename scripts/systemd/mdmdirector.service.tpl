[Unit]
Description=mdmdirector
After=network.target

[Service]
User=root
ExecStart=/usr/local/bin/mdmdirector -db-username ${db_username} -db-password ${db_password} -db-name ${db_name} -db-host ${db_host} -micromdmapikey ${micromdm_api_key} -micromdmurl https://${micromdm_server_url} -password ${mdmdirector_api_key} -db-port ${db_port} -db-sslmode require -loglevel debug
[Install]
WantedBy=multi-user.target