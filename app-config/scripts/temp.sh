
# CPU average

coreCount=4
coreLastId=$(expr $coreCount - 1)
tempSum=0



avgCpu=$(sensors | grep 'Core 0' | awk '{ print $3 }')
comp=$(sensors | grep 'Composite:' | awk '{ print $2 }')

printf " $avgCpu $comp\n"


