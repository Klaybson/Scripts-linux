#!/bin/bash
uname -isv
echo ""
echo -n " O que você deseja fazer? \n(A)Acessar Bk \n(B)ackup pagina web \n(C) BK no MySQL \n(D)Mover backup \n(S) Sair?"
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
            tar -cvzf  www-$(date +%d-%m-%Y_%H-%M-%S).tar.gz /var/www
    ;;
    c | C)
        /etc/init.d/mysql stop
        tar -cvzf mysql-$(date +%d-%m-%Y_%H-%M-%S).tar.gz /var/lib/mysql
        /etc/init.d/mysql start
    ;;
    d | D)
        mv *.gz /var/backups
    ;;
    s | S)
                echo  " Saindo... "
      ;;
      * )
        echo  " Opção inválida!"
    ;;

esac
