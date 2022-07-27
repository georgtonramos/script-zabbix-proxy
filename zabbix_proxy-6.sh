#!/bin/bash
echo "Install Zabbix Proxy 6.0 + Zabbix Agent - Ubuntu 20.04"
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-3+ubuntu20.04_all.deb
dpkg -i zabbix-release_6.0-3+ubuntu20.04_all.deb
apt update 
apt install -y  zabbix-proxy-sqlite3 zabbix-agent

echo "Copiar Arquivos .conf"
cp zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf
cp zabbix_proxy.conf /etc/zabbix/zabbix_proxy.conf

echo "Criando Base Sqlite3"
cd /var/lib/
mkdir zabbix
chown zabbix. zabbix/

echo "Iniciando os serviços - Zabbix Proxy"
systemctl enable zabbix-proxy
systemctl restart zabbix-proxy

echo "Iniciando os serviços - Zabbix Agent"
systemctl enable zabbix-agent
systemctl restart zabbix-agent

