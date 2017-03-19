import os
import sys

f = str(sys.argv[1])
i = str(sys.argv[2])

def insert(originalfile,string):
    with open(originalfile,'r') as f:
        with open('newfile.txt','w') as f2:
            f2.write(string)
            f2.write(f.read())
    os.rename('newfile.txt',originalfile)

insert(f , "{ \"_id\" : ObjectId(\"%s\"),"% i)
