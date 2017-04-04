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

cwd = os.getcwd()
dest = '/home/user/Dropbox/CSCI3308/mongoAPI/PastData/'
files = os.listdir(cwd)
num = time.strftime("%m-%d-%y_%H:%M_")

client = MongoClient('localhost', 27017)
db = client['snow']
coll = db.test

def addID(i, report):
    if (i<10):
        objId = ('ObjectId(FFFFFFFFFFFFFFFFFFFF000%s)' % i)
    else:
        objId = ('ObjectId(FFFFFFFFFFFFFFFFFFFF00%s)' % i)
    report.update({'_id' : objId})
    return objId


def addToMongo(objId, report):
    result = coll.replace_one({'_id' : objId}, report, True)

for f in files:
    if (f.endswith("json")):
        shutil.copyfile(f,dest+num+f)

with open('reports.txt', 'r') as apis:
    i = 1
    for line in apis:
        resortInfo = line.split(" ")
        name = resortInfo[0]
        api = resortInfo[1]
        pull = requests.get('%s' % api)
        report = xmltodict.parse(pull.text)
        objId = addID(i, report)
        addToMongo(objId, report)
        i = i + 1
        with open('%s.json' % name, 'w') as outfile:
            json.dump(report, outfile)
        # req = requests.get('%s' % url)
        # di = xmltodict.parse(req.text)
        # objId = ('ObjectId(FFFFFF%s)' % idNum)
        # di.update({'_id' : objId}))
