vol=$(amixer -D pulse get Master | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ print $3 }' | sed  's/%//')
sym="墳"

if [ "$vol" -lt "40" ]; then
    sym="奔";
fi
if [ "$vol" -eq "0" ]; then
    sym="";
fi

printf " $sym %s " $vol
