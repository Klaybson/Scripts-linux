#!/bin/bash
# Variaveis
DATAS='date +%y-%m-%d-%H.%M'
uname -isv


echo -n " O que você deseja fazer? (A) Acessar Bk / (B)ackup pagina web (C) BK no MySQL (S) Sair?"
read resposta
case  "$resposta"  in
    a | A | " " )
        if [ ! -d "/var/backups" ]; then
		mkdir /var/backups
		cd /var/backups
		echo "Diretorio criado"
	else
		
		echo  " Diretorio já existe"
		cd /var/backups
	fi
    ;;
    b | B)
       tar -zcvf www-$DATA.tar.gz /var/www
       mv  www-$DATA.tar.gz /var/backups 
    ;;
    c | C)
       	/etc/init.d/mysql stop 
	tar -zcvf mysql-$DATA.tar.gz /var/lib/mysql
	mv mysql-$DATA.tar.gz /var/backups
	/etc/init.d/mysql start 
     ;;	
     s | S)
		echo  " Saindo... "	
      ;;
      * )
        echo  " Opção inválida!"
    ;;
esac  
