total_ssd=$(df -H | grep sd | awk '{ print $2 }')
used_ssd=$(df -H | grep sd | awk '{ print $3 }')
load=$(iostat -d -x --dec=1 1 2 /dev/sda | tail -n 3 | awk '{ print $23 }')

printf "  %s / %s : $load %% " $used_ssd $total_ssd

