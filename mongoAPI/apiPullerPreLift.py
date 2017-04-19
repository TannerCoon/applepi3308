import unittest
import re
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
dest = cwd + '/PastData/'
files = os.listdir(cwd)
num = time.strftime("%m-%d-%y_%H:%M_")

uri = "mongodb://snowbuffs:snowbuffs3308@ds157380.mlab.com:57380/snow"
client = MongoClient(uri)
db = client['snow']
coll = db.buffs


class InputError(Exception):
    pass


def splitLine(line):

    checkSpace = "^[^\s]+\s[^\s]+$"
    checkApi = ".+\shttp\:\/\/www\.myweather2\.com\/developer\/weather\.ashx.+$"
    if (not re.match(checkSpace, line)):
        raise InputError('Expected name and api separated by a space')
        #break
    if (not re.match(checkApi, line)):
        raise InputError('Expected api to be from myweather2.com')
    resortInfo = line.split(" ")
    name = resortInfo[0]
    api = resortInfo[1]
    return name, api


def pullApi(api):
    checkApi = "^http\:\/\/www\.myweather2\.com\/developer\/weather\.ashx.+$"
    if (not re.match(checkApi, api)):
        raise InputError('Expected api to be from myweather2.com')
    pull = requests.get('%s' % api)
    report = xmltodict.parse(pull.text)
    return report

def addID(i, report):
    if (i>99):
        raise InputError("Expected less than 100 resorts")
    if (i<10):
        objId = ('ObjectId(FFFFFFFFFFFFFFFFFFFF000%s)' % i)
    else:
        objId = ('ObjectId(FFFFFFFFFFFFFFFFFFFF00%s)' % i)
    report.update({'_id' : objId})
    return objId


def addToMongo(objId, report):
    idCheck = "^ObjectId\(FFFFFFFFFFFFFFFFFFFF00\d\d\)$"
    if(not re.match(idCheck, objId)):
        raise InputError('ObjectId is in invalid form')
    result = coll.replace_one({'_id' : objId}, report, True)
    return result

def copyOldJson(name):
    shutil.copyfile(name,dest+num+name)

def writeToJson(name, report):
    with open('%s.json' % name, 'w') as outfile:
        json.dump(report, outfile)


def main():
    for f in files:
        if (f.endswith("json")):
            copyOldJson(f)
    resortFile = 'reports.txt'
    with open(resortFile, 'r') as apis:
        i = 0
        for line in apis:
            name, api = splitLine(line)
            report = pullApi(api)
            objId = addID(i, report)
            addToMongo(objId, report)
            i = i + 1
            writeToJson(name, report)


if __name__ == "__main__":
    main()
