curr=$(lscpu | grep 'CPU(s) scal' | awk '{ print $4 }')
max=$(lscpu | grep 'CPU max MHz' | awk '{ print $4 }')

percent=$(cat <(grep 'cpu ' /proc/stat) <(sleep 3 && grep 'cpu ' /proc/stat) | awk -v RS="" '{printf "%.1f", ($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5)}')

printf "   $percent %% / 龍 $curr% \n"

