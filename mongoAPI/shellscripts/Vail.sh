#! /bin/bash

FILE="Vail.json"
TEMP="VailTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF001B"
API="http://www.myweather2.com/developer/weather.ashx?uac=vQtC.5a4r4&uref=0d471bd5-854d-43a8-bcc9-bfb6021b97c6"

echo "Updating Vail"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
