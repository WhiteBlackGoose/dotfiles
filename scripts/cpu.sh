#!/bin/bash
curr=$(lscpu | grep 'CPU MHz' | awk '{ print $3 }')
max=$(lscpu | grep 'CPU max MHz' | awk '{ print $4 }')
N=10
FILLED_N=$(echo "scale=0; $N*$curr/$max" | bc)
EMPTY_N=$(echo "scaled=0; $N-$FILLED_N" | bc)

percent=$(cat <(grep 'cpu ' /proc/stat) <(sleep 3 && grep 'cpu ' /proc/stat) | awk -v RS="" '{printf "%.1f", ($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5)}')

printf " $percent %% /"

currInt=$(echo "scale=1; $curr/1000" | bc)
printf " $currInt GHz"


printf " |"

for (( c=0; c<$FILLED_N; c++ ))
do
	printf "/"
done

for (( c=0; c<$EMPTY_N; c++ ))
do
	printf " "
done

printf "| "
