#! /bin/bash

FILE="Silverton_Mountain.json"
TEMP="Silverton_MountainTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0013"
API="http://www.myweather2.com/developer/weather.ashx?uac=O5kgnochWm&uref=422fb08d-a24a-4f2c-b69f-a843680bd847"

echo "Updating Silverton_Mountain"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
