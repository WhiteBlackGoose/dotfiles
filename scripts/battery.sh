batnow=$(cat /sys/class/power_supply/BAT0/charge_now)
batfull=$(cat /sys/class/power_supply/BAT0/charge_full)
stat=$(echo "scale=0; 100*$batnow/$batfull" | bc)
supply=$(cat /sys/class/power_supply/BAT0/status)

if [ "$supply" = "Discharging" ]; then
    sym=""
else
    sym="";
fi

echo " $sym  $stat % "

