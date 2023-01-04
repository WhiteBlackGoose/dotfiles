ip=$(ifconfig | grep -A1 wlo1 | tail -n 1 | awk '{ print $2 }')
echo " 爵  $ip "

