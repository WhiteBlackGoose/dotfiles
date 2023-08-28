date_inv=$(date +'%Y-%m-%d:%a')
time_local=$(TZ=Europe/Berlin date +'%H:%M:%S')
echo " $date_inv|$time_local"
