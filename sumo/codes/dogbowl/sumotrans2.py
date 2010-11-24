import os, sys
import urllib
from subprocess import call, Popen

aurl = "http://sports.yahoo.co.jp/sumo/etc/torikumi/201005/"
afile = "201005.txt"
urllib.urlretrieve(aurl, afile)
bfilename = afile+".utf"
bfile = open(bfilename, 'w')
Popen(["iconv", "-f", "EUCJP", "-t", "UTF-8", afile], stdout = bfile)
bfile.close()

# test_client.py
from poster.encode import multipart_encode
from poster.streaminghttp import register_openers
import urllib2
refineUPUrl = "http://127.0.0.1:3333/command/core/create-project-from-upload"
register_openers()

datagen, headers = multipart_encode({"project-file": open(bfilename), "project-name": "bbb"})

request = urllib2.Request(refineUPUrl, datagen, headers)
print urllib2.urlopen(request).read()