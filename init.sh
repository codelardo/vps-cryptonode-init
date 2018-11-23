#!/bin/bash

echo "Configurando memoria swap"
sudo dd if=/dev/zero of=/var/swap.img bs=4096k count=1000
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
sudo chmod 0600 /var/swap.img
sudo chown root:root /var/swap.img
echo -e "/var/swap.img none swap sw 0 0 \n" >> /etc/fstab

echo "Actualizando el sistema"
apt-get update && dist-upgrade

echo "Instalando programas"
sudo apt-get -y install build-essential autoconf libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils git htop
sudo apt-get -y install libboost-all-dev
sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get -y install libdb4.8-dev libdb4.8++-dev
sudo apt-get -y install libminiupnpc-dev
sudo apt-get -y install libzmq3-dev
