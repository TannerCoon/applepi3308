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
from bs4 import BeautifulSoup


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

def pullSlopeReportToJson():
	arapUrl = "http://coloradoski.com/snow-report"
	arapWeb = requests.get(arapUrl)

	data = []

	soup = BeautifulSoup(arapWeb.text, "html.parser")
	table = soup.find('table', attrs={"id":"snow-report"})
	table_body = table.find('tbody')

	rows = table_body.find_all('tr')
	for row in rows:
		cols = row.find_all('td')
		cols = [ele.text.strip() for ele in cols]
		data.append([ele for ele in cols if ele])
	return data

def resortNumberMatch(x):
	return {
	0: 0,
	1: 1,
	3: 5,
	6: 6,
	7: 8,
	8: 9,
	11: 10,
	13: 13,
	15: 2,
	16: 14,
	17: 15,
	18: 16,
	19: 7,
	20: 17,
	22: 18,
	23: 19,
	24: 20,
	25: 11,
	27: 3,
	28: 21,
	}.get(x,-1)
	
def appendRunInfo(inReport, data, resNum):
	tempstr = data[resNum][0]
	if(tempstr[-8:] != '(Closed)'):
		a = data[resNum][5]
		b = data[resNum][6]
		c = data[resNum][7]
		d = data[resNum][8]
		e = 'Currently Open'		
	else:
		a = 'Not available'
		b = 'Not available'
		c = 'Not available'
		d = 'Not available'
		e = 'Closed'
	temp_dict = {"run_report":{"resort_open": e, "lifts_open": a, "beginner_open": b,
				 "intermediate_open": c, "advanced_open": d}}
	inReport.update(temp_dict)
	return inReport

def main():
    for f in files:
        if (f.endswith("json")):
            copyOldJson(f)
    slopeData = pullSlopeReportToJson()
    resortFile = 'reports.txt'
    with open(resortFile, 'r') as apis:
        i = 0
        for line in apis:
            name, api = splitLine(line)
            report = pullApi(api)
            resortIndex = resortNumberMatch(i)
            if (resortIndex != -1):
		report = appendRunInfo(report, slopeData, resortIndex)
            objId = addID(i, report)
            addToMongo(objId, report)
            i = i + 1
            writeToJson(name, report)
#i == 0 or i == 1 or i == 3 or i == 6 or
#i == 7 or i == 8 or i == 11 or i == 13 or
#i == 15 or i == 16 or i == 17 or i == 18 or 
#i == 19 or i == 20 or i == 22 or i == 23 or 
#i == 24 or i == 25 or i == 27 or i == 28

if __name__ == "__main__":
    main()
