#!/bin/bash

# Get the date to determinate the current season
month=`date "+%m"`
day=`date "+%d"`

if [ $month = 01 ] || [ $month = 02 ] || ( [ $month = 12 ] && [ $day -gt 15 ] ) || ( [ $month = 03 ] && [ $day -le 15 ] )
	then
		season="winter"
	elif [ $month = 04 ] || [ $month = 05 ] || ( [ $month = 03  ] && [ $day -gt 15 ] ) || ( [ $month = 06 ] && [ $day -le 15 ] )
		then
			season="spring"
	elif [ $month = 07 ] || [ $month = 08 ] || ( [ $month = 06 ] && [ $day -gt 15 ] ) || ( [ $month = 09 ] && [ $day -le 15 ] )
		then
			season="summer"
	else
		season="autumn"
fi

echo $season

# Indiquer le fichier où se trouve les fonds d'écran en fonction de la saison
# Choisir un fond d'écran au hasard
# Modifier le fond d'écran actuel
# Va falloir faire une variable qui représentera le dossier où se trouve les 4 dossiers de fonds d'écran
