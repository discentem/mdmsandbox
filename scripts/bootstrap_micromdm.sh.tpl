#!/bin/bash
sudo yum install wget -y
wget https://dl.eff.org/certbot-auto
## We should absolutely check the code signature here. Do as I say, not as I do.
mv ./certbot-auto /usr/local/bin/certbot-auto
sudo chown root /usr/local/bin/certbot-auto
sudo chmod 0755 /usr/local/bin/certbot-auto
## We should definitely check the hash here and use other security measures
wget https://github.com/micromdm/micromdm/releases/download/v1.7.1/micromdm_v1.7.1.zip
mkdir micromdm_repo