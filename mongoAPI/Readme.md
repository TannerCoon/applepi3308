#Install python & python-pip:

sudo apt-get install python
sudo apt-get install python-pip

#Install xml2json:

pip install https://github.com/hay/xml2json/zipball/master

#Install mongodb 3.4 Ubuntu 16.04:

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6

echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list

sudo apt-get update

sudo apt-get install -y mongodb-org

sudo service mongod start

#Run pullAPI2json.sh

change dest = "" in moveold.py

Run in directory:

./pullAPI2json

#Check Database with Robomongo

install robomongo

db.mycol.find().sort({_id : 1})