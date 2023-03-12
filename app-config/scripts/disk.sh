used_root=$(df -H | grep nvme0n1p6 | awk '{ print $3 }')
used_home=$(df -H | grep home | awk '{ print $3 }')

printf "  /: %s | /home: %s \n" $used_root $used_home

