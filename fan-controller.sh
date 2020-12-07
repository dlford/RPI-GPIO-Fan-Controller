#!/bin/sh

startTemp=65 # Fan on temp
fanGPIO=18 # GPIO Pin
lowPollingTime=15 # Polling seconds when under start temp
highPollingTime=60 # Polling seconds when over start temp

echo "$fanGPIO" > /sys/class/gpio/export > /dev/null 2>&1
echo "out" > /sys/class/gpio/gpio$fanGPIO/direction > /dev/null 2>&1

while [ "1" = "1" ]; do
	temp=$(vcgencmd measure_temp | cut -c6,7)
	fanStatus="$(cat /sys/class/gpio/gpio$fanGPIO/value)"
	if [ $temp -ge $startTemp ]; then
		if [ $fanStatus -eq 0 ]; then
			echo "1" > /sys/class/gpio/gpio$fanGPIO/value
			echo "Temperature: $temp; Fan started"
		fi
		sleep $highPollingTime
	elif [ $temp -lt $startTemp ]; then
		if [ $fanStatus -eq 1 ]; then
			echo "0" > /sys/class/gpio/gpio$fanGPIO/value
			echo "Temperature: $temp; Fan stopped"
		fi
		sleep $lowPollingTime
	fi
done
