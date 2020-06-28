#!/bin/bash
# Variaveis
DADOS = ' data +% d-% m-% y-% H.% M '
uname -isv


echo -n " O que você deseja fazer? (A) Acessar Bk / (B)ackup pagina web (C) BK no MySQL (S) Sair?"
read resposta
case  "$resposta"  in
    a | A | " " )
        if [ -d  "/var/backups" ]
	then
		echo  " Diretorio já existe"
		cd /var/backups
	else
		mkdir /var/backups
		cd /var/backups
		echo "Diretorio criado"
	fi
    ;;
    b | B)
       tar -zcvf www- $ DATA .tar.gz / var / www  
    ;;
    c | C)
       	/etc/init.d/mysql stop 
	tar -zcvf mysql- $ DATA .tar.gz /var/lib/mysql
	/etc/init.d/mysql start 
     ;;	
     s | S)
		echo  " saindo "	
      ;;
      * )
        echo  " Opção inválida "
    ;;
esac  
