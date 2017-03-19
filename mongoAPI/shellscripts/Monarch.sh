#! /bin/bash

FILE="Monarch.json"
TEMP="MonarchTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0011"
API="http://www.myweather2.com/developer/weather.ashx?uac=iToHnHAdcq&uref=8d8c2660-330e-4bc3-8416-9af28f0cc70e"

echo "Updating Monarch"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
