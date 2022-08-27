#!/bin/bash

used=$(nvidia-smi | head -n 10 | tail -n 1 | awk '{ print $9 }' | sed 's/MiB//')

total=$(nvidia-smi | head -n 10 | tail -n 1 | awk '{ print $11 }' | sed 's/MiB//')

percent=$(bc <<< "scale=1; $used * 100 / $total")

printf "   %s %% / %'d Mb " $percent $used


