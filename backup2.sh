#!/bin/bash
# Variaveis
DATA='date + %d-%m-%y-%H.%M'Impressões
uname -isv


echo -n "O que deseja fazer? (A)Acessar Bk /(B)Backup do /var/www / (C)BK do MySQL (S)air? [A] "
read resposta
case "$resposta" in
    a|A|"")
        if [ -d "/var/backup" ] 
		then
			echo "Diretorio não existia"
			mkdir /var/backup
			cd /var/backup
		fi
    ;;
    b|B)
       tar -zcvf www-$DATA.tar.gz /var/www  
    ;;
    c|C)
       /etc/init.d/mysql stop 
		tar -zcvf mysql-$DATA.tar.gz /var/lib/mysql
		/etc/init.d/mysql start 
	;;	
	s|S)
		echo "saindo"	
	;;
    *)
        echo "Opção inválida"
    ;;
esac
