#! /bin/bash

FILE="Aspen.json"
TEMP="AspenTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0002"
API="http://www.myweather2.com/developer/weather.ashx?uac=gz3CwN-rsj&uref=fd8cc39c-f13f-4b0b-a641-0827518d7203"

echo "Updating Apsen"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
