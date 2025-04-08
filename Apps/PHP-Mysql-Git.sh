#!/bin/bash

# Solicitar variables al usuario
read -p "Ingrese el nombre del usuario MySQL: " MYSQL_USER
read -sp "Ingrese la contraseña para MySQL: " MYSQL_PASSWORD
echo ""

# Actualizar sistema e instalar NGINX
echo "Instalando NGINX..."
sudo apt update && sudo apt install nginx -y

# Instalar PHP 8.2 y módulos necesarios
echo "Instalando PHP 8.2 y módulos..."
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install -y php8.2 php8.2-fpm php8.2-cli php8.2-bcmath php8.2-dev \
                    php8.2-common php8.2-opcache php8.2-readline php8.2-mbstring \
                    php8.2-curl php8.2-gd php8.2-imagick php8.2-mysql php8.2-zip \
                    php8.2-intl php8.2-pgsql php8.2-xml php-pear

# Modificar configuración de PHP 8.2
echo "Modificando configuración de PHP..."
sudo sed -i 's/memory_limit = 128M/memory_limit = 1G/g' /etc/php/8.2/fpm/php.ini
sudo sed -i 's/post_max_size = 8M/post_max_size = 1G/g' /etc/php/8.2/fpm/php.ini
sudo sed -i 's/max_file_uploads = 20/max_file_uploads = 30/g' /etc/php/8.2/fpm/php.ini
sudo sed -i 's/max_execution_time = 30/max_execution_time = 900/g' /etc/php/8.2/fpm/php.ini
sudo sed -i 's/max_input_time = 60/max_input_time = 3000/g' /etc/php/8.2/fpm/php.ini
sudo sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 1G/g' /etc/php/8.2/fpm/php.ini

# Reiniciar PHP-FPM
echo "Reiniciando PHP-FPM..."
sudo systemctl restart php8.2-fpm

# Instalar GIT
echo "Instalando Git..."
sudo apt install git-all -y

# Instalar MySQL
echo "Instalando MySQL Server..."
sudo apt update && sudo apt install mysql-server -y

# Crear usuario en MySQL
echo "Creando usuario en MySQL..."
sudo mysql -e "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'localhost' WITH GRANT OPTION;"
sudo mysql -e "FLUSH PRIVILEGES;"

echo "✅ Instalación completa. Usuario '${MYSQL_USER}' creado en MySQL."
