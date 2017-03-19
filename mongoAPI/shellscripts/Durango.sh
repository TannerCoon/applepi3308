#! /bin/bash

FILE="Durango.json"
TEMP="DurangoTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF000B"
API="http://www.myweather2.com/developer/weather.ashx?uac=TeXh7IeZdN&uref=d45b0485-0832-4a55-b122-9d83effcca1a"

echo "Updating Durango"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
