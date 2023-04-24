ip=$(ifconfig | grep -A1 wlo1 | tail -n 1 | awk '{ print $2 }')
ssid=$(nmcli -t -f name connection show --active | head -n 1)
echo "  $ssid"

