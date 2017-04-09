#python file to get drive time data from google maps

import urllib2
import json

#dictionary of resorts for testing
#<script>

ski_resorts = {
    "Keystone":{'city': 'Keystone', 'state': 'CO'},
    "Breckenridge":{'city': 'Breckenridge', 'state': 'CO'},
    "Winter Park":{'city':'Winter+Park', 'state': 'CO'},
    "Copper":{'city':'Copper', 'state':'CO'},
    "Eldora":{'city':'Eldora', 'state':'CO'},
    "Loveland":{'city':'Dillon', 'state':'CO'},
    "Arapahoe Basin":{'city':'A-Basin+Ski+Resort', 'state':'CO'}
    }

for resort in ski_resorts:
    request = 'https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=Boulder,CO&destinations={0},{1}&key=AIzaSyDSMcE-OZ0c96S6CWFi5FXRRf6_RoVt7Cc'.format(ski_resorts[resort]['city'],ski_resorts[resort]['state'])
    response = urllib2.urlopen(request)
    data = json.loads(response.read())
    text = data["rows"][0]["elements"][0]["duration"]["text"]
    value = data["rows"][0]["elements"][0]["duration"]["value"]
    time = json.dumps(text)
    number = json.dumps(value)

    print time
    print number
#</script>
