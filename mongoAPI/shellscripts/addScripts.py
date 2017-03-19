import sys

name = str(sys.argv[1])
api = str(sys.argv[2])

print "#! /bin/bash\n\nFILE=\"%s.json\"\nTEMP=\"%sTemp.json\"\nID=\"\"\nAPI=\"%s\"\n\necho \"Updating %s\"\n\ncurl -s $API | xml2json -t xml2json -o $FILE\ncut -c 2- $FILE > $TEMP\ncp $TEMP $FILE\nrm $TEMP\npython addID.py $FILE $ID" % (name, name, api, name)
