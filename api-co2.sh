#!/bin/bash
SECONDS=`date '+%s'`
NAME='co2.ppm'
VALUE=`sudo python3 /home/pi/iot-dojo/co2.py`
#echo -e "${NAME}\t${VALUE}\t${SECONDS}"
/usr/bin/curl https://api.mackerelio.com/api/v0/services/CO2/tsdb -H 'X-Api-Key: 7KNS5JxNeCwdyqoviSWzhCbnNmqwjp6sk89YkYbwvumL' -H 'Content-Type: application/json' -X POST -d '[{"name": "Co2.ppm", "time": '$(date +%s)', "value": '${VALUE}'}]'
