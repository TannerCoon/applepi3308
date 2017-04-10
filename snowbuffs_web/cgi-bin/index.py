#!/usr/bin/python
import urllib2
import json


print "Content-Type: text/html"
print 
content = '''
    <html>

    <head>
      <meta charset="utf-8" />
    <title>Snow buffs </title>
      <link rel="stylesheet" type="text/css" href="style/main.css" />
    </head>
    <body>
    <section id="pagecontent">

    <div id="header">
    <h1>Snow reports</h1>
    </div>

    <div id="nav">
    <li><a href="index.html">Aspen</a></li>
    <li><a href="Silverton.html">Silverton Mountain</a></li>
    <li><a href="Monarch.html">Monarch Mountain</a></li>
    </div>
    <div id="section">
    <h2>Aspen</h2>
    <p id = "status"> Current Aspen ski resort status is  open</p>
    <p id = "weather"> Current Aspen ski resort weather is sunny</p>
    <p id = "temperature" >The lower temperature is </p>
    <p id = "temperature" >The higher temperature is </p>
    </div>

    </body>
    </html>
    '''

print content
