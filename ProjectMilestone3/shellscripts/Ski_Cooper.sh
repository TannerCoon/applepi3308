#! /bin/bash

FILE="Ski_Cooper.json"
TEMP="Ski_CooperTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0014"
API="http://www.myweather2.com/developer/weather.ashx?uac=-vvOhiNp1S&uref=25aefb6e-75ba-4246-ba4e-12749b56fbc8"

echo "Updating Ski_Cooper"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
