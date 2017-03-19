#! /bin/bash

FILE="Breckenridge.json"
TEMP="BreckenridgeTemp.json"
ID="FFFFFFFFFFFFFFFFFFFF0006"
API="http://www.myweather2.com/developer/weather.ashx?uac=qpsks6PaWj&uref=83650111-1488-47f5-9f79-5dff932f5f1c"

echo "Updating Breckenridge"

curl -s $API | xml2json -t xml2json -o $FILE
cut -c 2- $FILE > $TEMP
cp $TEMP $FILE
rm $TEMP
python addID.py $FILE $ID
