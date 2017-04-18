from apiPuller import *
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

#name1, api1 = splitLine("hello ")
#name, api = splitLine("hello")

class TextprocTestCase(unittest.TestCase):

    def test_splitLine(self):
        print "Testing splitLine"
        spaceCheck = "helloworld"
        apiCheck = "hello http://www.googelapi.com/mapstuff"
        good = "hello http://www.myweather2.com/developer/weather.ashxa"
        self.assertEqual(("hello", "http://www.myweather2.com/developer/weather.ashxa"),splitLine(good), "Expected api to be from myweather2.com")
        with self.assertRaises(InputError):
            splitLine(spaceCheck)
        with self.assertRaises(InputError):
            splitLine(apiCheck)

    def test_pullApi(self):
        print "Testing pullApi"
        badApi = "http://www.googelapi.com/mapstuff"
        goodApi = "http://www.myweather2.com/developer/weather.ashx?uac=TkX-IE5BZs&uref=9a734856-dc47-4542-a1f2-909b49b96665"
        pull = requests.get('%s' % goodApi)
        report = xmltodict.parse(pull.text)
        self.assertEqual(report, pullApi(goodApi), "Error in passing api to puller")
        with self.assertRaises(InputError):
            pullApi(badApi)

    def test_addID(self):
        print "Testing addID"
        goodApi = "http://www.myweather2.com/developer/weather.ashx?uac=TkX-IE5BZs&uref=9a734856-dc47-4542-a1f2-909b49b96665"
        pull = requests.get('%s' % goodApi)
        report = xmltodict.parse(pull.text)
        retObjId = addID(0,report)
        expctID = "ObjectId(FFFFFFFFFFFFFFFFFFFF0000)"
        self.assertTrue(report["_id"] != None)
        self.assertEqual(report["_id"], expctID, "Error assinging _id field")
        with self.assertRaises(InputError):
            addID(100, report)

    def test_addToMongo(self):
        print "Testing addToMongo"
        goodApi = "http://www.myweather2.com/developer/weather.ashx?uac=TkX-IE5BZs&uref=9a734856-dc47-4542-a1f2-909b49b96665"
        pull = requests.get('%s' % goodApi)
        report = xmltodict.parse(pull.text)
        retObjId = addID(0,report)
        badId = "ObjectId(bad id)"
        with self.assertRaises(InputError):
            addToMongo(badId, report)



if __name__ == '__main__':
    unittest.main()
