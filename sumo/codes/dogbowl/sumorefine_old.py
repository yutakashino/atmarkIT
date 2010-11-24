import os, sys
import urllib2, urllib
from subprocess import call, Popen
from poster.encode import multipart_encode
from poster.streaminghttp import register_openers
import time
import re
from BeautifulSoup import BeautifulSoup
from sumoconst import *

variations = [x+y for x in YEAR for y in MONTH]

projid = []
#for val in variations:
for val in variations[:-1]:
    #get data from Yahoo! Sports
    aurl = YSURL + val + "/"
    afile = val + ".txt"
    res = urllib.urlretrieve(aurl, afile)
    #transform EUC-JP to UTF-8
    bfilename = val + ".utf.txt"
    bfile = open(bfilename, 'w')
    Popen(["iconv", "-f", "EUCJP", "-t", "UTF-8", afile], stdout = bfile)
    bfile.close()
    #upload to Google Refine
    projname = val + "proj"
    register_openers()
    datagen, headers = multipart_encode({"project-file": open(bfilename), "project-name": projname})
    request = urllib2.Request(UPURL, datagen, headers)
    response = urllib2.urlopen(request).read()
    #get project id from the response
    soup = BeautifulSoup(response.lower())
    for item in soup.findAll('script'):  
        a = re.findall(r"\d+", str(item))
        if a:
            id = a[0]
            break
    time.sleep(2)
    print id
    #process refine via JSON
    URL1 = URL1.replace('PROJID_', id)
    HEAD1['REFERER'] = HEAD1['REFERER'].replace('PROJID_', id)
    request = urllib2.Request(URL1, OP1, HEAD1)
    response = urllib2.urlopen(request).read()
    time.sleep(1)
    #download CSV from Refine
    OP2 = OP2.replace('PROJID_', id)
    URL2 = URL2.replace('PROJNAME_', projname)
    HEAD2['REFERER'] = HEAD2['REFERER'].replace('PROJID_', id)
    request = urllib2.Request(URL2, OP2, HEAD2)
    response = urllib2.urlopen(request).read()
    time.sleep(1)
    print response
    