import os, sys
import urllib
from subprocess import call, Popen
from poster.encode import multipart_encode
from poster.streaminghttp import register_openers
import urllib2
import time
import re
from BeautifulSoup import BeautifulSoup

#year = ["1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010"]
year = ["2010"]
#month = ["01", "03", "05", "07", "09", "11"]
month = ["01", "03"]
variations = [x+y for x in year for y in month]

refineUPUrl = "http://127.0.0.1:3333/command/core/create-project-from-upload"

projid = []
#for val in variations:
for val in variations[:-1]:
    #get data from Yahoo! Sports
    aurl = "http://sports.yahoo.co.jp/sumo/etc/torikumi/"+val+"/"
    afile = val+".txt"
    res = urllib.urlretrieve(aurl, afile)
    #transform EUC-JP to UTF-8
    bfilename = val+".utf.txt"
    bfile = open(bfilename, 'w')
    Popen(["iconv", "-f", "EUCJP", "-t", "UTF-8", afile], stdout = bfile)
    bfile.close()
    #upload to Google Refine
    projname = val+"proj"
    register_openers()
    datagen, headers = multipart_encode({"project-file": open(bfilename), "project-name": projname})
    request = urllib2.Request(refineUPUrl, datagen, headers)
    response = urllib2.urlopen(request).read()
    #get project id from response
    soup = BeautifulSoup(response.lower())
    for item in soup.findAll('script'):  
        a = re.findall(r"\d+", str(item))
        if a:
            id = a[0]
            break
    time.sleep(2)
    print id
