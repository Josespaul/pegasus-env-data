#!/bin/bash

#Mock-Emulator

while true
do
echo -n "===== " >> peg.log
echo -n $(date)  >> peg.log
echo -n " =====" >> peg.log
echo >> peg.log

#co2
f1=$(shuf -i 350-450 -n 1)
#curl 'https://api.thingspeak.com/update?api_key=QF1DIQAE4J8DEYTL&field1=${f1}' &>2
echo "CO2=${f1}" >> peg.log
#sleep 17

#No2
f2=$(shuf -i 200-2000 -n 1)
f22=$(echo "scale=4; ${f2} / 10000" | bc)
f2=$(echo "scale=4; ${f22} + 2" | bc)
#curl 'https://api.thingspeak.com/update?api_key=QF1DIQAE4J8DEYTL&field2=${f1}' &>2
echo "NO2=${f2}" >> peg.log
#sleep 17

#CO
f3=$(shuf -i 200-9000 -n 1)
f33=$(echo "scale=4; ${f3} / 10000" | bc)
f3=$(echo "scale=4; ${f33} + 0" | bc)
#curl 'https://api.thingspeak.com/update?api_key=QF1DIQAE4J8DEYTL&field3=${f3}' &>2
echo "CO=${f3}" >> peg.log
#sleep 17

#SO2
f4=$(shuf -i 7000-9000 -n 1)
f44=$(echo "scale=4; ${f4} / 10000" | bc)
f4=$(echo "scale=4; ${f44} + 0" | bc)
#curl 'https://api.thingspeak.com/update?api_key=QF1DIQAE4J8DEYTL&field4=${f4}' &>2
echo "SO2=${f4}" >> peg.log
#sleep 17

#AQI
f5=$(shuf -i 100-170 -n 1)
#curl 'https://api.thingspeak.com/update?api_key=QF1DIQAE4J8DEYTL&field5=${f5}' &>2
echo "AQI=${f5}" >> peg.log
#sleep 17

echo "==========" >> peg.log
echo >> peg.log
echo >> peg.log
echo >> peg.log


cd /home/pi/pegasus-env-data
git commit -a -m "mock update"

if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  git push origin master
else
  true
fi

sleep 30

done