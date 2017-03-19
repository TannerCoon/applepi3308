#! /bin/bash

FILE="Telluride.json"
TEMP="TellurideTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0019"
API="http://www.myweather2.com/developer/weather.ashx?uac=6OfqrjBVlG&uref=82102610-e090-4f5a-86fb-7c9913584802"

echo "Updating Telluride"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
