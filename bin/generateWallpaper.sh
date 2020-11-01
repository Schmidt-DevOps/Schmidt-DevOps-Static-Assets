#!/usr/bin/env bash

WALLPAPER_SVG=./img/templates/debian-greyish-wallpaper-widescreen.svg
WALLPAPER_PNG=debian-greyish-wallpaper-widescreen.png
LOGO_SVG=logo.svg
LOGO_PNG=logo.png

WORK_DIR=/tmp/

SIZES=("1024x768" "1280x1024" "1440x900" "1440x1050" "1920x1080" "1600x1200" "1920x1200" "2560x1440" "3200x1800" "2560x2048" "1366x768" "4080x768")

cp ./img/logo/logo_schmidt_devops.svg ${WORK_DIR}${LOGO_SVG}

convert -transparent "#ffffff" -resize 50% ${WORK_DIR}${LOGO_SVG} png32:${WORK_DIR}${LOGO_PNG}

for size in "${SIZES[@]}"
do
    echo -n "Doing $size..."
    convert ${WALLPAPER_SVG} -resize "${size}!" ${WORK_DIR}${size}'_'${WALLPAPER_PNG}
    composite -resize '1x1<' -gravity NorthEast ${WORK_DIR}${LOGO_PNG} -geometry +50+50 ${WORK_DIR}${size}'_'${WALLPAPER_PNG} ${WORK_DIR}${size}'_'${WALLPAPER_PNG}
    echo "done."
done