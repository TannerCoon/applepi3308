#! /bin/bash

FILE="Winter_Park.json"
TEMP="Winter_ParkTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF001C"
API="http://www.myweather2.com/developer/weather.ashx?uac=Ahn96IIEQe&uref=706bbb9c-e6be-47b3-898a-053f02bdb908"

echo "Updating Winter_Park"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
