#! /bin/bash

FILE="SolVista.json"
TEMP="SolVistaTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0016"
API="http://www.myweather2.com/developer/weather.ashx?uac=i4S-vzKCk0&uref=2b8c017f-f4c5-40ff-b5f0-957d5d6d11a3"

echo "Updating SolVista"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
