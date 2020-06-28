#!/bin/bash
echo "==============================Olá===================================="
uname -isv
hostname
echo "===========O que você deseja fazer?===============
(A)Diretorio de Backup.
(B)Backup da pagina Web.
(C)Backup do MySQL.
(S)Sair?."
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
       #compacta com data e hora
       tar -cvzf  www-$(date +%d-%m-%Y_%H-%M-%S).tar.gz /var/www
       #Verifica se o diretorio de backup existe. Se existir move
       if [ ! -d "/var/backups" ]; then
                echo "Diretorio */var/backups* inexistente "
                echo "Arquivo Salvo no diretorio:"
                pwd
       else
                mv *.gz /var/backups
        fi

    ;;
    c | C)
        /etc/init.d/mysql stop
        tar -cvzf mysql-$(date +%d-%m-%Y_%H-%M-%S).tar.gz /var/lib/mysql
        /etc/init.d/mysql start
         if [ ! -d "/var/backups" ]; then
                echo "Diretorio */var/backups* inexistente "
                echo "Arquivo salvo no diretorio:"
                pwd
       else
                mv *.gz /var/backups
        fi
    ;;
    s | S)
                echo  " Saindo... "
      ;;
      * )
        echo  " Opção inválida!"
    ;;

esac
