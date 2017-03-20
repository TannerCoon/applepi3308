# File desriptions:

# shellscripts/*.sh:
	Each pull the corrisponding API to a json document

# addID.py
	Takes two arguments, a json file name and an id string, then appends 
	the id to the beginning of the json document

# moveold.py
	Copies all json documents in the current directory into a new directory
	and adds the current date and time to the file name

# pullAPI2json.sh
	Automates all the above scripts to pull the API information into the
	Mongo database

# Milestone3JSONbreakdown.pdf
	A document showing the breakdown of the json documents we are storing