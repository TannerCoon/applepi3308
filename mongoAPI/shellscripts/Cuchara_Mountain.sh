#! /bin/bash

FILE="Cuchara_Mountain.json"
TEMP="Cuchara_MountainTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF000A"
API="http://www.myweather2.com/developer/weather.ashx?uac=k9AWFig1N2&uref=3c15e003-6c54-4d28-8268-29b549ad5be8"

echo "Updating Cuchara_Mountain"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
