#!/bin/bash
total_hard=$(df -H | grep sda5 | awk '{ print $2 }')
used_hard=$(df -H | grep sda5 | awk '{ print $3 }')

total_ssd=$(df -H | grep nvme0n1p2 | awk '{ print $2 }')
used_ssd=$(df -H | grep nvme0n1p2 | awk '{ print $3 }')

printf "  %s / %s  漢 %s / %s " $used_hard $total_hard $used_ssd $total_ssd

