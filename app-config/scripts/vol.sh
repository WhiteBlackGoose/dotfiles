vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ print $2 }')
vol=$(echo "scale=0; $vol * 100" | bc)

# vol=$(amixer -D pulse get Master | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ print $3 }' | sed  's/%//')
sym="󰕾 "

printf "$sym %s\n" $vol
