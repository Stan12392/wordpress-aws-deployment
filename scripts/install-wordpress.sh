#!/bin/bash
# Run on Amazon Linux 2023 EC2 after SSH login
set -e

sudo dnf update -y
sudo dnf install -y httpd wget php php-mysqlnd php-json php-gd php-xml php-mbstring
sudo systemctl enable --now httpd

cd /var/www/html
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzf latest.tar.gz
sudo mv wordpress/* .
sudo rm -rf wordpress latest.tar.gz
sudo chown -R apache:apache /var/www/html
sudo chmod -R 755 /var/www/html

echo "WordPress files installed. Open http://EC2_PUBLIC_IP to finish setup."
echo "Point wp-config at your RDS endpoint (not localhost)."
