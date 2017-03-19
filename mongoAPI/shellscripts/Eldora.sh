#! /bin/bash

FILE="Eldora.json"
TEMP="EldoraTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF000C"
API="http://www.myweather2.com/developer/weather.ashx?uac=l3rp7SWBAM&uref=c9522b18-3eaf-483c-8b14-24054dc5c18b"

echo "Updating Eldora"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
