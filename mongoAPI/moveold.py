import shutil
import os
import sys

cwd = os.getcwd()
dest = '/home/user/Dropbox/CSCI3308/mongoAPI/PastData/'
files = os.listdir(cwd)
num = str(sys.argv[1])

for f in files:
    if (f.endswith("json")):
        shutil.copyfile(f,dest+num+f)
