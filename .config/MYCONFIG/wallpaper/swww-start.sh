# Clearing cache so that the last used wallpaper isn't displayed immediately at daemon start
swww clear-cache

swww kill
swww-daemon &
sleep 0.5

# Setting the background to black for a cool transition effect to the image
swww clear 000000
sleep 0.1
swww query # Has to be done because of a bug so that the black bacjgrouind color is actually set

sleep 2.5
swww img ~/Pictures/satpaper_latest.png
