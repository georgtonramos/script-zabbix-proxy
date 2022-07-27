#!/bin/bash
echo "Install Zabbix Proxy 6.0 - Ubuntu 20.04"

wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-3+ubuntu20.04_all.deb
dpkg -i zabbix-release_6.0-3+ubuntu20.04_all.deb
apt update 
apt install zabbix-proxy-sqlite3

echo "Iniciando os serviços"
systemctl restart zabbix-proxy