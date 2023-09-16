used_root=$(df -H | grep 'home' | awk '{ print $3 }')

printf " : %s\n" $used_root

