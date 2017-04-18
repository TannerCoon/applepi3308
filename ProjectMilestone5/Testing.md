Brandon Pedrianes, Brett Milliken, Tanner Coon, Taylor Nguyen, Xuan Zhou

Snowbuffs.com

Vision Statement:
To provide the convenience of viewing the daily snow reports from
skiing resorts across Colorado, all on one webpage.


Auto Test Cases (unittest) Explanation:

This tests out multiple functions within our apiPuller code.
The code we are testing, pulls information from 29 different api's
for our 29 different snow resorts. The code then adds an id field that 
corisponds to the mongo database id field. It then updates those postings
on a mongodb cloud server. In this process it also writes out json files 
that we store and can utilize if a need presents itself. The test code uses 
the python unittest library and tests most of the functions we call in our
apiPuller code. It checks everything from Execptions being called when 
expected to functions returning the expected results. 


UAT Plans are written in (User Acceptance Tests.md)


