#! /bin/bash

FILE="Keystone.json"
TEMP="KeystoneTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF000F"
API="http://www.myweather2.com/developer/weather.ashx?uac=uYHdNMVxDD&uref=4c675da6-7d54-4c0e-89a6-c952518d448f"

echo "Updating Keystone"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
