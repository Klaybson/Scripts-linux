#!/bin/bash

# Variaveis
DATA='date + %d-%m-%y-%H.%M'
# Pega o número do ip
IP_LOCAL = $ ( / sbin / ifconfig | sed -n ' 2 p '  | awk ' {print $ 2} ' )


# Nome da placa de rede
NOME_PLACA = $ ( / sbin / ifconfig | sed -n ' 1 p '  | awk ' {print $ 1} '    ) I

# Impressões
claro

# Imprime o nome do sistema (arquitetura, distribuição)
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
