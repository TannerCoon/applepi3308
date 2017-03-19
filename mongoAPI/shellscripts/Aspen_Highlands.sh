#! /bin/bash

FILE="Aspen_Highlands.json"
TEMP="Aspen_HighlandsTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0003"
API="http://www.myweather2.com/developer/weather.ashx?uac=NJMUTpwtjX&uref=82e9acb9-911d-4e13-b5f8-e009f47d956e"

echo "Updating Aspen_Highlands"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
