date_inv=$(date +'%Y-%m-%d')
time_home=$(date +'%H:%M:%S')
time_local=$(TZ=Asia/Bishkek date +'%H:%M:%S')
echo "   $date_inv | $time_home | $time_local"
# echo "   $date_inv $time_home "
