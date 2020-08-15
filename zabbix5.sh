#!/bin/bash

#Instale um repositorio zabbix.

wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1+bionic_all.deb
dpkg -i zabbix-release_5.0-1+bionic_all.deb
apt update

#Instale o servidor Zabbix, frontend, agente.

pt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-agent

#Criar banco de dados inicial

mysql -uroot -p
#digite a senha
mysql> create database zabbix character set utf8 collate utf8_bin;
mysql> create user zabbix@localhost identified by 'password';
mysql> grant all privileges on zabbix.* to zabbix@localhost;
mysql> quit;

#No host do servidor Zabbix, importe o esquema inicial e os dados. Você será solicitado a inserir sua senha recém-criada.

vim /etc/zabbix/zabbix_server.conf
#Editar DBPassword=Coloce_a_senha

vim /etc/zabbix/apache.conf
#php_value date.timezone America/Bahia

#Iniciar o servidor Zabbix e os processos do agente

systemctl restart zabbix-server zabbix-agent apache2
systemctl enable zabbix-server zabbix-agent apache2
#Fim
