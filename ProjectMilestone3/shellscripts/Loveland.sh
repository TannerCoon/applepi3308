#! /bin/bash

FILE="Loveland.json"
TEMP="LovelandTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0010"
API="http://www.myweather2.com/developer/weather.ashx?uac=VtppfA1VBE&uref=b1b7dd40-5589-4870-9a9e-0eeaf11c288a"

echo "Updating Loveland"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
