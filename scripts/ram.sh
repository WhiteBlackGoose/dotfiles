#!/bin/bash


# https://github.com/KittyKatt/screenFetch/issues/386#issuecomment-249312716

total=$(expr $(cat /proc/meminfo | grep MemTotal | head -n 1 | awk '{ print $2 }') / 1024)
free=$(expr $(cat /proc/meminfo | grep MemFree | head -n 1 | awk '{ print $2 }') / 1024)
shmem=$(expr $(cat /proc/meminfo | grep Shmem | head -n 1 | awk '{ print $2 }') / 1024)
buffers=$(expr $(cat /proc/meminfo | grep Buffers | head -n 1 | awk '{ print $2 }') / 1024)
cached=$(expr $(cat /proc/meminfo | grep Cached | head -n 1 | awk '{ print $2 }') / 1024)
reclaimable=$(expr $(cat /proc/meminfo | grep SReclaimable | head -n 1 | awk '{ print $2 }') / 1024)

used=$(expr $total + $shmem - $free - $buffers - $cached - $reclaimable)


percent=$(echo "scale=1; 100*$used/$total" | bc)
printf "   %s %% / %'d Mb " $percent $used

