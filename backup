#!/bin/bash
#Acesso ao diretorio de backup
cd /var/backup
#Criação da variável contendo a data atual:
DATA='date + %d-%m-%y-%H.%M'
#FAz backup da pasta do servidor webcd  /var/www:
tar -zcvf www-$DATA.tar.gz /var/www
#Para o MySQL e faz o backup das bases de dados:
/etc/init.d/mysql stop 
tar -zcvf mysql-$DATA.tar.gz /var/lib/mysql
/etc/init.d/mysql start 
