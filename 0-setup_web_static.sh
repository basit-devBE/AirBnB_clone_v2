#!/usr/bin/env bash
# Script that sets up your web servers for the deployment of web_static

sudo apt-get -y update
sudo apt-get -y install nginx

sudo mkdir -p /data/
sudo mkdir -p /data/web_static/
sudo mkdir -p /data/web_static/releases/
sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/
sudo touch /data/web_static/releases/test/index.html
echo "Holberton School" | 
sudo tee /data/web_static/releases/test/index.html

sudo ls -sf /data/web_static/releases/test/ /data/web_static/current
sudo chowm -R ubuntu:ubuntu /data/

sudo sed -i '/listen 80b/a location/hbnh_static { alias /data/web_static/current/; }' /etc/nginx/sites-available/default

sudo service nginx restart
