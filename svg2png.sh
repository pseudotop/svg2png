#!/bin/bash
######################
## svg2png script
######################

# $1 is width pixel value.
if [ -n "$1" ];then
    pixel=$1
else
    pixel=690
fi

# saved "arr" which includes the directories of "svg" file
arr=(`find /var/www/html/w/images -path /var/www/html/w/images/thumb -prune -o -name "*.svg"`)
for i in ${arr[@]};do
    echo $i
done

cat << EOF
====== converting SVG to PNG (Files : ${#arr[@]}) ======
EOF
for i in ${arr[@]};do
    j=${i##*images/} # will remove front of "images/" including itself.
    filename=$(basename ${i})
    echo "convert -background none -density ${pixel} -resize ${pixel}x ${i} /var/www/html/w/images/thumb/${j}/${pixel}px-${filename}.png"
    # please check your environment, before you run this command.
    #convert -background none -density ${pixel} -resize ${pixel}x ${i} /var/www/html/w/images/thumb/${j}/${pixel}px-${filename}.png
done
echo "===== end ====="
