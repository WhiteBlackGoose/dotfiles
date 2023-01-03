date_inv=$(date +'%Y-%m-%d')
time_home=$(date +'%H:%M:%S')
tz=$(cat /home/goose/.config/scripts/currtz)
time_local=$(TZ=$tz date +'%H:%M:%S')
if [ "$time_home" = "$time_local" ]; then
    echo "   $date_inv $time_home "
else
    time_home_h=$(date +'%H')
    time_local_h=$(TZ=$tz date +'%H')
    if [ "$time_home_h" = "$time_local_h" ]; then
        echo "   $date_inv $time_home "
    else
        echo "   $date_inv   $time_home   $time_local "
    fi
fi
