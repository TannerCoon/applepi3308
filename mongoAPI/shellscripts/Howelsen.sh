#! /bin/bash

FILE="Howelsen.json"
TEMP="HowelsenTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF000E"
API="http://www.myweather2.com/developer/weather.ashx?uac=rw8.HivEAT&uref=4181817e-6c22-4d7e-af39-07c1475be19f"

echo "Updating Howelsen"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
