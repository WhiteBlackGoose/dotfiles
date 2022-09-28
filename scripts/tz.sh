#!/bin/bash
tz=$(~/programs/tzupdate.py -p)
printf "$tz"
printf "$tz" > ./currtz
