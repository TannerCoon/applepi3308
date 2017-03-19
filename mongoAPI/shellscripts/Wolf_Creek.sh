#! /bin/bash

FILE="Wolf_Creek.json"
TEMP="Wolf_CreekTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF001D"
API="http://www.myweather2.com/developer/weather.ashx?uac=7QLROV6Fj.&uref=543cbe30-9089-4112-9960-ae56d1f4201b"

echo "Updating Wolf_Creek"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
