#!/bin/bash
# Variaveis
DADOS = ' data +% d-% m-% y-% H.% M ' Impressões
uname -isv


echo -n " O que você deseja fazer? (A) Acessar Bk / (B)ackup pagina web (C) BK no MySQL (S) Sair?"
head resposta
case  " $ resposta "  in
    a | A | " " )
        if [ -d  " / var / backup " ]
		then
			echo  " Diretorio não existe"
			cd / var / backup
		else
			echo "Diretorio criado /var/backup"
			mkdir /var/backup
			cd /var/backup
		fi
    ;;
    b | B)
       tar -zcvf www- $ DATA .tar.gz / var / www  
    ;;
    c | C)
       /etc/init.d/mysql stop 
		tar -zcvf mysql- $ DATA .tar.gz / var / lib / mysql
		/etc/init.d/mysql start 
	;;	
	s | S)
		echo  " saindo "	
	;;
    * )
        echo  " Opção inválida "
    ;;
esac 
