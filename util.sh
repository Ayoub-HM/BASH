#!/bin/bash
#
#fichier des donctions d'affichage

function banner {
echo "*            Bienvenue dans l'outil de la           *"
echo "                S U P E R V I S I O N                "
echo "                                 _     _             "
echo " ___ _   _ _ __   ___ _ ____   _(_)___(_) ___  _ __  "
echo "/ __| | | | '_ \ / _ \ '__\ \ / /   __| |/ _ \| '_ \ "
echo "\__ \ |_| | |_) |  __/ |   \ V /| \__ \ | (_) | | | |"
echo "|___/\__,_| ,__/ \___|_|    \_/ |_|___/_|\___/|_| |_|"
echo "          |_|                                        "
}



function print_menu {
  while (true)
  do
    echo "Vous pouvez : "
    echo ""
    echo "  => 1) Redémarrer le serveur"
    echo "  => 2) Parramétre résaux"
    echo "  => 3) Afficher les utilisateurs"
    echo "  => 4) Quitter ce super programme "
    echo ""
    read -p "Que voulez vous faire :" choix
    echo ""

case $choix in
        "1" ) sudo reboot;;
        "2" ) $BASE/ip_config;;
        "3" ) $BASE/users;;
        "4" ) exit 0;;
	*) echo "Veuillez saisir un nombre valide!";;
esac
pause
done
}




function printOK {
  echo "$1"
  if test "$2" = "0"
  then
    echo "$ok"
  else
    echo "$nok"
  fi
}

function pause {
  echo "Appuyer sur Entree pour continuer..."
  read
}

function warning {
  echo "ATTENTION !!!"
  echo "Toutes les actions entreprises sont renseignees dans le journal d'evenement !"
  echo ""
}
