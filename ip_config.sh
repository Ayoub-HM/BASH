#!/bin/bash

BASE=$(dirname "$0")
. $BASE/util
#. $BASE/main

function getGateway {

	dr=$(ip route | grep default | cut -d" " -f3)
	echo " Default gateway : $dr"
}

function getServerIP {
	IPAdrs=$(hostname -I)
	echo " Host IP address : $IPAdrs"
}

function deviceStatus {
	nmcli device status
}

function pingPasserelle {
	gtw=$(ip route | grep default | cut -d" " -f3)
	ping -c 4 "$gtw"

}

function testInternet {

 ping -c 1 8.8.8.8

}



while (true)
do
    echo "Vous pouvez : "
    echo ""
    echo "  => 1) afficher la route par défault"
    echo "  => 2) Afficher l'address IP du serveur"
    echo "  => 3) Afficher les status des cartes réseaux "
    echo "  => 4) Tester le ping vers la passerelle"
    echo "  => 5) Test la connectivity"
    echo "  => 6) Retourner en arrière  "
    echo ""
    read -p "Que voulez vous faire : " choix
    echo ""

case $choix in
        "1" ) getGateway;;
        "2" ) getServerIP;;
	"3" ) deviceStatus;;
        "4" ) pingPasserelle;;
        "5" ) testInternet;;
	"6" ) print_menu;;
esac
pause
done
