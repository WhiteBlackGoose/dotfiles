date_inv=$(date +'%Y-%m-%d')
time_home=$(date +'%H:%M:%S')
tz=$(cat /home/goose/.config/scripts/currtz)
time_local=$(TZ=$tz date +'%H:%M:%S')
echo "   $date_inv $time_home "
