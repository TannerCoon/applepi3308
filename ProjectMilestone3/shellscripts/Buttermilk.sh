#! /bin/bash

FILE="Buttermilk.json"
TEMP="ButtermilkTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0007"
API="http://www.myweather2.com/developer/weather.ashx?uac=e2HHx4nCwF&uref=2394cc47-6589-4425-b75b-617977c6ba01"

echo "Updating Buttermilk"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
