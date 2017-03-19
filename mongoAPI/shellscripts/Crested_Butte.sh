#! /bin/bash

FILE="Crested_Butte.json"
TEMP="Crested_ButteTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0009"
API="http://www.myweather2.com/developer/weather.ashx?uac=ZiXoZyZY7L&uref=ddb95461-9327-40d2-baff-4f473f550971"

echo "Updating Crested_Butte"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
