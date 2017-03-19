#! /bin/bash

FILE="Beaver_Creek.json"
TEMP="Beaver_CreekTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0005"
API="http://www.myweather2.com/developer/weather.ashx?uac=sIBhAm3EaR&uref=7e7788a0-a840-4430-82d7-1fd911ef2642"

echo "Updating Beaver_Creek"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
