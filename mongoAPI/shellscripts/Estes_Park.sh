#! /bin/bash

FILE="Estes_Park.json"
TEMP="Estes_ParkTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF000D"
API="http://www.myweather2.com/developer/weather.ashx?uac=-xG.L0.y0y&uref=245c7101-55c3-48d7-b8a7-942846d3d1b4"

echo "Updating Estes_Park"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
