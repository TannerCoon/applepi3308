#! /bin/bash

for i in {1..26}
do
  read NAME API <<< $( awk 'FNR == "'${i}'" {print $3" "$4}' reports.csv )
  python addScripts.py $NAME $API > $NAME.sh
done
