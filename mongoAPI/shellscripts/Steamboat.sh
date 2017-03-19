#! /bin/bash

FILE="Steamboat.json"
TEMP="SteamboatTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0017"
API="http://www.myweather2.com/developer/weather.ashx?uac=.-ah53mZku&uref=5b096cf7-2db8-472d-9c38-7384a578e04a"

echo "Updating Steamboat"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
