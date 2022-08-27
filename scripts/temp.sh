#!/bin/bash

# CPU average

coreCount=4
coreLastId=$(expr $coreCount - 1)
tempSum=0

for (( i=0; i<$coreCount; i++ ))
do
    temp=$(sensors | grep "Core $i" | awk '{ print $3 }' | sed 's/\+//' | sed 's/°C//')
    tempSum=$(bc -l <<< "$tempSum + $temp")
done
 
avgCpu=$(bc <<< "scale=1; $tempSum / $coreCount")

# GPU

gpu=$(nvidia-smi | head -n 10 | tail -n 1 | awk '{ print $3 }' | sed 's/C//')


printf " 﨏  $avgCpu °C / $gpu °C "


