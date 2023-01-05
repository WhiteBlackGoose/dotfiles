total_ssd=$(df -H | grep nvme0n1p6 | awk '{ print $2 }')
used_ssd=$(df -H | grep sd | awk '{ print $3 }')

printf "  %s / %s " $used_ssd $total_ssd

