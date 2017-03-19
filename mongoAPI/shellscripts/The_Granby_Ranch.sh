#! /bin/bash

FILE="The_Granby_Ranch.json"
TEMP="The_Granby_RanchTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF001A"
API="http://www.myweather2.com/developer/weather.ashx?uac=RfqzT.Qgxg&uref=55d2cf0f-f440-45db-9f13-5a1e9feab322"

echo "Updating The_Granby_Ranch"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
