#!/bin/bash
sudo apt-get update;
sudo apt-get install -y lamp-server^;
sudo a2enmod rewrite;
sudo apt-get install -y php5 php5-curl php5-gd php5-mcrypt php5-mysql;
sudo service apache2 restart;
sudo apt-get install -y phpmyadmin;
sudo php5enmod mcrypt;
sudo service apache2 restart;
sudo chown root:root /etc/phpmyadmin/ -R;
sudo chown root:www-data /etc/phpmyadmin/config-db.php;
sudo chown root:www-data /etc/phpmyadmin/htpasswd.setup;
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf.d/phpmyadmin.conf;
sudo /etc/init.d/apache2 reload;
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-enabled/phpmyadmin.conf;
sudo /etc/init.d/apache2 reload;
sudo service apache2 restart;
clear;
