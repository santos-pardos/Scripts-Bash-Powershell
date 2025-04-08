#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install apache2 -y
sudo apt install mysql-server -y
sudo apt install php libapache2-mod-php php-mysql -y
php -v
sudo wget https://wordpress.org/latest.tar.gz
sudo tar xzf latest.tar.gz
cd wordpress
sudo cp -r . /var/www/html
cd /var/www/html
sudo rm index.html