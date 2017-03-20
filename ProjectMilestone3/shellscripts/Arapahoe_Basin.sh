#! /bin/bash

FILE="Arapahoe_Basin.json"
TEMP="Arapahoe_BasinTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0001"
API="http://www.myweather2.com/developer/weather.ashx?uac=TkX-IE5BZs&uref=9a734856-dc47-4542-a1f2-909b49b96665"

echo "Updating Arapahoe_Basin"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
