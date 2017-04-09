import requests
import json
import dpath.util
import xmltodict
import sys
import time
import os
import shutil
import pymongo
from pymongo import MongoClient

cwd = os.getcwd() #getting where you are working
dest = cwd + '/PastData/' #create path to put old data
files = os.listdir(cwd) #gets files that are currently in directory
num = time.strftime("%m-%d-%y_%H:%M_") #tell files apart when you store them

client = MongoClient('localhost', 27017) #prep to connect to mongo
db = client['snow'] #creating database called snow
coll = db.buffs #collections(tables) naming collections buffs within snow

#organizing library with indexing
#mongo stores with 24 hexadecimal number
def addID(i, report):
    if (i<10):
        objId = ('ObjectId(FFFFFFFFFFFFFFFFFFFF000%s)' % i)
    else:
        objId = ('ObjectId(FFFFFFFFFFFFFFFFFFFF00%s)' % i)
    report.update({'_id' : objId}) #taking dictionary(report) update by adding ID field (customizing ID, so not random)
#we can understand better
    return objId

#taking a report and putting into mongo database
#if something already exists replace and if doesn't put it in
def addToMongo(objId, report):
    result = coll.replace_one({'_id' : objId}, report, True)

#go through each file and if it ends with json put in pastdata
for f in files: 
    if (f.endswith("json")):
        shutil.copyfile(f,dest+num+f)

#open text file with api's stored in it
with open('reports.txt', 'r') as apis:
    i = 1
    for line in apis: #going through api's in text file to grab information
        resortInfo = line.split(" ")
        name = resortInfo[0]
        api = resortInfo[1]
        pull = requests.get('%s' % api) #calling http for current line
        report = xmltodict.parse(pull.text) #turn pull into python dictionary
        objId = addID(i, report) #call addID function
        addToMongo(objId, report) #putting in mongo database
        i = i + 1
       
        with open('%s.json' % name, 'w') as outfile:
            json.dump(report, outfile)
        # req = requests.get('%s' % url)
        # di = xmltodict.parse(req.text)
        # objId = ('ObjectId(FFFFFF%s)' % idNum)
        # di.update({'_id' : objId}))
