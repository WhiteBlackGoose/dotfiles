#!/bin/sh
sysctl -a | grep tz0.temperature | awk '{ print $2 }'
