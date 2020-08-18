# Seasons Wallpaper
### Script bash pour Linux sous environnement de bureau XFCE, permettant de modifier le fond d'écran en fonction des saisons

___

##### La constante DIRECTORY_PATH doit être définie dans le script afin d'indiquer le chemin absolu du dossier où se trouvent les fonds d'écran. Dans ce dossier, les images doivent se trouver dans quatre sous-dossiers différents nommés "winter", "spring", "summer" et "autumn". Chaque sous-dossier doit contenir au moins deux images

##### Les formats d'image supportés par le script sont ".jpeg", ".jpg", ".png" ou ".gif"

##### Rendez le script exécutable pour pouvoir le lancer avec les commandes:
```bash
cd chemin_du_script
chmod +x seasonsWallpaper.sh
```

##### Utilisez crontab pour lancer le script périodiquement. Lancez la commande:
```bash
crontab -e
```
##### puis à la fin de ce fichier ajoutez par exemple la ligne:
```bash
0 0 */5 * * bash /chemin_absolu_du_script/seasonsWallpaper.sh
```
##### pour lancer le script tout les 5 jours
