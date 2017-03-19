#! /bin/bash

chmod u+x shellscripts/*
echo "Starting API pulls"

DATE=`date +%Y-%m-%d_%H:%M_`

python moveold.py $DATE

echo "Starting Arapahoe_Basin.sh"
./shellscripts/Arapahoe_Basin.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Arapahoe_Basin.json

echo "Starting Aspen.sh"
./shellscripts/Aspen.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Aspen.json

echo "Starting Aspen_Highlands.sh"
./shellscripts/Aspen_Highlands.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Aspen_Highlands.json

echo "Starting Aspen_Snowmass.sh"
./shellscripts/Aspen_Snowmass.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Aspen_Snowmass.json

echo "Starting Beaver_Creek.sh"
./shellscripts/Beaver_Creek.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Beaver_Creek.json

echo "Starting Breckenridge.sh"
./shellscripts/Breckenridge.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Breckenridge.json

echo "Starting Buttermilk.sh"
./shellscripts/Buttermilk.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Buttermilk.json

echo "Starting Copper_Mountain.sh"
./shellscripts/Copper_Mountain.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Copper_Mountain.json

echo "Starting Cuchara_Mountain.sh"
./shellscripts/Cuchara_Mountain.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Cuchara_Mountain.json

echo "Starting Durango.sh"
./shellscripts/Durango.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Durango.json

echo "Starting Eldora.sh"
./shellscripts/Eldora.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Eldora.json

echo "Starting Estes_Park.sh"
./shellscripts/Estes_Park.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Estes_Park.json

echo "Starting Howelsen.sh"
./shellscripts/Howelsen.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Howelsen.json

echo "Starting Keystone.sh"
./shellscripts/Keystone.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Keystone.json

echo "Starting Loveland.sh"
./shellscripts/Loveland.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Loveland.json

echo "Starting Monarch.sh"
./shellscripts/Monarch.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Monarch.json

echo "Starting Powderhorn.sh"
./shellscripts/Powderhorn.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Powderhorn.json

echo "Starting Silverton_Mountain.sh"
./shellscripts/Silverton_Mountain.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Silverton_Mountain.json

echo "Starting Ski_Cooper.sh"
./shellscripts/Ski_Cooper.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Ski_Cooper.json

echo "Starting Snowmass.sh"
./shellscripts/Snowmass.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Snowmass.json

echo "Starting SolVista.sh"
./shellscripts/SolVista.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file SolVista.json

echo "Starting Steamboat.sh"
./shellscripts/Steamboat.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Steamboat.json

echo "Starting Sunlight.sh"
./shellscripts/Sunlight.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Sunlight.json

echo "Starting Telluride.sh"
./shellscripts/Telluride.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Telluride.json

echo "Starting The_Granby_Ranch.sh"
./shellscripts/The_Granby_Ranch.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file The_Granby_Ranch.json

echo "Starting Vail.sh"
./shellscripts/Vail.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Vail.json

echo "Starting Winter_Park.sh"
./shellscripts/Winter_Park.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Winter_Park.json

echo "Starting Wolf_Creek.sh"
./shellscripts/Wolf_Creek.sh
echo "Writing to database"
mongoimport -d dbtest -c mycol --mode merge --file Wolf_Creek.json

echo "Completed/n"
