#!/bin/bash
#----------------------------------------------------------------------------------#
#                                                                                  #
#  For use the script, the DIRECTORY_PATH constant must points to a directory      #
#  containing four others directories. These directories' names must be "winter",  #
#  "spring", "summer" and "autumn" and must contain wallpapers to display.         #
#  Supported formats for wallpapers are ".jpeg", ".jpg", ".png" or ".gif".         #
#  Each seasons' directories must contain at least 2 items.                        #
#                                                                                  #
#----------------------------------------------------------------------------------#

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$UID/bus"

# Define the absolute directory path that contains the four others directories
DIRECTORY_PATH=directory_path_that_contains_seasons_directories

# Check the required directories
if [ ! -d $DIRECTORY_PATH ] || [ -z $DIRECTORY_PATH ]
	then echo -e "Error: specified directory \"$DIRECTORY_PATH\" doesn't exist\nPlease set the DIRECTORY_PATH variable"
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

path=$DIRECTORY_PATH/$season

# Get the wallpapers from the directory which corresponds to the current season
actualWallpaper=`xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image`
newWallpaper=$actualWallpaper

cd $path
IFS='
'
wallpapers=( `ls *.jpeg *.jpg *.png *.gif` )

# Check if the directory contains at least 2 items
if [ ${#wallpapers[@]} -lt 2 ]
	then
		echo "Error: the \"$season\" directory must contain at least 2 wallpapers"
		exit
fi

# Randomly choose a different wallpaper than the one already set
while [ $actualWallpaper = $newWallpaper ]
do
	newWallpaper=$path/${wallpapers[$(( $RANDOM % ${#wallpapers[@]} ))]}
done

# Set the wallpaper
`xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s $newWallpaper`
