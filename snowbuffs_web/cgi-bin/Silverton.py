#!/usr/bin/python3
import urllib.request
import json
import cgitb
cgitb.enable()

print("Content-Type: text/html")
print() 
content = '''
<!DOCTYPE HTML>
<html>
<body>
<head>
  <meta charset="utf-8" />
<title>Silverton Mountain </title>
  <link rel="stylesheet" type="text/css" href="style/main.css" />
</head>
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
<h2>Silverton Mountain</h2>
<p id = "status"> CUrrent Silverton Mountain ski resort status is  open</p></p>
<p id = "weather"> CUrrent Silverton Mountain ski resort weather is sunny</p>
<p id = "temperature" >The lower temperature is </p>
<p id = "temperature" >The higher temperature is </p>
</div>

</body>
</html>
'''
