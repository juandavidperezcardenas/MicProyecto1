#!/bin/bash
##########TOOLS############
echo “Instalando TOOLS”
sudo apt install net-tools -y
sudo apt install vim -y


##########INTALARCION CONSUL#############
echo “Instalando CONSUL”
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo “deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main” | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install consul



##########Instalar nodejs###########
echo “Instalando NODEJS”
sudo apt install nodejs
sudo apt install npm
git clone https://github.com/omondragon/consulService

echo “Modificando index.js con sed”
sed -i 's/const HOST='192.168.100.3';/const HOST='192.168.100.10';/g' /consulService/app/index.js

### Install HAProxy
sudo apt-get update
sudo apt-get install -y haproxy
