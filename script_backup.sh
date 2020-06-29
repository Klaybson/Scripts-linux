#!/bin/bash
clear
uname -isv
echo ''
echo "======================================Ola==============================================="
echo ""
hostname
echo ""
echo "============================== Escolha o servico =======================================
(a)Diretorio de Backup.
(b)Backup da pagina Web.
(c)Backup do MySQL (stop e restart).
(s)Sair?."
read resposta

	while [ "$resposta" != "s" ]
	do
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
			#compacta com data e hora diretorio de pagina web
			tar cvzf  www-$(date +%d-%m-%Y_%H-%M-%S).tar.gz /var/www
			#Verifica se o diretorio de backup existe. Se existir move
		    if [ ! -d "/var/backups" ]; then
					echo "Diretorio */var/backups* inexistente "
					echo "Arquivo Salvo no propio diretorio:"
					pwd
		    else
					mv www-$(date +%d-%m-%Y_%H-%M-%S).tar.gz /var/backups
		    fi
		;;
		c | C)
			#Faz o backup do banco de dados especifico!
			mysqldump -u root -p mysql > /var/backups/mysql$(date +%d-%m-%Y_%H-%M-%S).sql		       
		;;
		s | S)
			echo  " Saindo... "
		;;
		* )
			echo  " Opcao invalida!"
		;;
		esac
	echo "===========O que você deseja fazer?===============
	(a)Diretorio de Backup.
	(b)Backup da pagina Web.
	(c)Backup do MySQL.
	(s)Sair?."
	read resposta
done 
