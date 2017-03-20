#! /bin/bash

FILE="Sunlight.json"
TEMP="SunlightTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0018"
API="http://www.myweather2.com/developer/weather.ashx?uac=.JA.wGVL7l&uref=2a2430a6-f6b4-46e6-9949-89ac066f31b8"

echo "Updating Sunlight"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
