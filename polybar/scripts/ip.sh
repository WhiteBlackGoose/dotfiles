#!/bin/sh
ip=$(ifconfig wlan0 | grep 'inet' | awk '{ print $2 }')
ssid=$(ifconfig wlan0 | grep 'ssid' | awk '{ print $2 }')
printf "$ip $ssid"
