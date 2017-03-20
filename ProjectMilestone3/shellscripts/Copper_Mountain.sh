#! /bin/bash

FILE="Copper_Mountain.json"
TEMP="Copper_MountainTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0008"
API="http://www.myweather2.com/developer/weather.ashx?uac=fyIXaXQq8U&uref=76161b99-315f-4595-95eb-30778dcae014"

echo "Updating Copper_Mountain"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
