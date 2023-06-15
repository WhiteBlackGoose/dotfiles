current_raw=$(cat /sys/class/power_supply/BAT0/current_now)
charge_raw=$(cat /sys/class/power_supply/BAT0/charge_now)
voltage_raw=$(cat /sys/class/power_supply/BAT0/voltage_now)
current=$(echo "scale=2; $current_raw/1000000" | bc)
charge=$(echo "scale=2; $charge_raw/1000000" | bc)
voltage=$(echo "scale=2; $voltage_raw/1000000" | bc)
power_drain=$(echo "scale=1; $current * $voltage" | bc)
time_left=$(echo "scale=0; $charge * 60 /$current" | bc)


batnow=$(cat /sys/class/power_supply/BAT0/charge_now)
batfull=$(cat /sys/class/power_supply/BAT0/charge_full)
stat=$(echo "scale=0; 100*$batnow/$batfull" | bc)
supply=$(cat /sys/class/power_supply/BAT0/status)

if [ "$supply" = "Discharging" ]; then
    sym="󰁹"
else
    sym="⚡"
fi

echo "$sym $stat%|${current}A|${power_drain}W|${time_left}min"
# echo " $sym  $stat % $power_drain W "
