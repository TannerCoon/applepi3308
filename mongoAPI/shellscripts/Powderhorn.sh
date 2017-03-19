#! /bin/bash

FILE="Powderhorn.json"
TEMP="PowderhornTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0012"
API="http://www.myweather2.com/developer/weather.ashx?uac=HQu5G4jaXY&uref=a0226000-663f-4be3-b6bd-6ba296fbbdab"

echo "Updating Powderhorn"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
