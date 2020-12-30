#!/bin/bash
SECONDS=`date '+%s'`
NAME='co2.ppm'
VALUE=`sudo python3 /home/pi/iot-dojo/co2.py`
echo -e "${NAME}\t${VALUE}\t${SECONDS}"

