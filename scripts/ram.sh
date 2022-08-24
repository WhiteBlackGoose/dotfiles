#!/bin/bash

total=$(expr $(cat /proc/meminfo | grep MemTotal | head -n 1 | awk '{ print $2 }') / 1024)
used=$(expr $(cat /proc/meminfo | grep MemAvailable | head -n 1 | awk '{ print $2 }') / 1024)
used=$(expr $total - $used)

percent=$(echo "scale=1; 100*$used/$total" | bc)
printf "   %s %% / %'d Mb " $percent $used

