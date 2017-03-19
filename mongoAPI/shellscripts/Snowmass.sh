#! /bin/bash

FILE="Snowmass.json"
TEMP="SnowmassTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0015"
API="http://www.myweather2.com/developer/weather.ashx?uac=B-49DW8ZEB&uref=1e35b2e3-6825-468f-99f6-4e0d2d46ff49"

echo "Updating Snowmass"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
