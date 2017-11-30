!/bin/bash

echo "Configurando memoria swap"
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=1000
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
sudo chmod 0600 /var/swap.img
sudo chown root:root /var/swap.img
echo -e "/var/swap.img none swap sw 0 0 \n" >> /etc/fstab

echo "Actualizando el sistema"
apt-get update && dist-upgrade

echo "Instalando programas"
apt-get -y install build-essential autoconf automake git htop
