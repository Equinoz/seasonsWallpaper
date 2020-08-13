#!/bin/bash
#----------------------------------------------------------------------------------#
#                                                                                  #
#  For use the script, the DIRECTORY_PATH constant must points to a directory      #
#  containing four others directories. These directories' names must be "winter",  #
#  "spring", "summer" and "autumn" and must contain wallpapers to display          #
#                                                                                  #
#----------------------------------------------------------------------------------#

# Define the absolute directory path that contains the four others directories
DIRECTORY_PATH=/home/julien/Bureau/seasonsWallpaper/wallpapers

# Check the required directories
if [ ! -d $DIRECTORY_PATH ]
	then echo "Error: specified directory \"$DIRECTORY_PATH\" doesn't exist"
	exit
fi

for directory in "winter" "spring" "summer" "autumn"
do
	if [ ! -d $DIRECTORY_PATH/$directory ]
		then echo "Error: there is no \"$directory\" directory in $DIRECTORY_PATH"
			exit
	fi
done

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

wallpapersPath=$DIRECTORY_PATH/$season

echo $wallpapersPath

# Choisir un fond d'écran au hasard dans le dossier correspondant à la saison en cours
# Modifier le fond d'écran actuel