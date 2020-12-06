#!/bin/sh

maxTemp=55 # Fan on
fanGPIO=18 # GPIO Pin

echo "$fanGPIO" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio$fanGPIO/direction

while [ "1" = "1" ]
do
temp=`vcgencmd measure_temp | cut -c6,7`
echo "Temperature: $temp"
if [ $temp -ge $maxTemp ]
then
  echo "Fan started: "$(date)
  echo "1" > /sys/class/gpio/gpio$fanGPIO/value
elif [ $temp -lt $maxTemp ]
then
  echo "Fan stopped: "$(date)
  echo "0" > /sys/class/gpio/gpio$fanGPIO/value
fi
sleep 30
done
