date_inv=$(date +'%Y-%m-%d')
time_home=$(TZ=Europe/Moscow date +'%H:%M:%S')
time_local=$(TZ=Europe/Berlin date +'%H:%M:%S')
echo " $date_inv|$time_home|$time_local"
# echo "   $date_inv $time_home "
