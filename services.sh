#!/bin/bash

#
# Gestion des services
# Version 1
#
# Arguments :
# $1 : le nom du service a relancer
#
. ./util

# Test l'etat du service
# Si le service est demarre, il propose de le relancer
# Sinon le service est demarre
function startService {
  service=$1
  service $service status 1> /dev/null 2>&1
  status=$?
  if test "$status" = "0"
  then
    # Le service fonctionne deja
    # Faut-il le relancer ?
    echo "Le service $service fonctionne..."
    read -p "Voulez vous le relancer ? O/N " rep
    if test "$rep" = "O" -o "$rep" = "o"
    then
      # L'utilisateur a demande a le relancer
      logger "SUPP -> Relance d'apache"
      msg="Relance du serveur $service"
      service $service restart 1> /dev/null 2>&1
      printOK "$msg" "$?"
    else
      # L'utilisateur ne veut pas le relancer
      msg="Le service ne sera pas relance"
      printOK "$msg" "0"
    fi
  else
    # Le service ne fonctionne pas
    # Demarrage
    logger "SUPP -> Demarrage d'apache"
    msg="Lancement du serveur $service"
    service $service start 1> /dev/null 2>&1
    printOK "$msg" "$?"
  fi
}

# Gestion du service fourni en argument
service=$1
startService $service
