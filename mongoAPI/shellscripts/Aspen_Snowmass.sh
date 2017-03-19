#! /bin/bash

FILE="Aspen_Snowmass.json"
TEMP="Aspen_SnowmassTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0004"
API="http://www.myweather2.com/developer/weather.ashx?uac=ERaBwS4wB4&uref=dc820338-56da-4d93-817d-bd5b2c40e3a7"

echo "Updating Aspen_Snowmass"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
