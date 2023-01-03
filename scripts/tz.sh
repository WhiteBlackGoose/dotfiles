tz=$(~/programs/tzupdate.py -p)
printf "$tz"
if [ -n "$tz" ]; then
    printf "$tz" > /home/goose/.config/scripts/currtz
fi
