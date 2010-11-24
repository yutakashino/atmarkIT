#!/opt/local/bin/python
# -*- coding: utf-8 -*-
import os, sys
import urllib2, urllib
from subprocess import Popen
from poster.encode import multipart_encode
from poster.streaminghttp import register_openers
import time
import re
from BeautifulSoup import BeautifulSoup

#do HTTP request to Refine
def request2Refine(url, ops, header):
    request = urllib2.Request(url, ops, header)
    return urllib2.urlopen(request).read()

def main():
    #a bunch of constants of this script
    from sumoconst import YEAR, MONTH, YSURL, UPURL, URL1, HEAD1, OP1, URL2, HEAD2, OP2
    #make the variations of sumo stats data
    variations = [x+y for x in YEAR for y in MONTH]
    for val in variations[:-1]:
        #get a Y!S HTML from Yahoo! Sports
        aurl = YSURL + val + "/"
        afile = val + ".txt"
        res = urllib.urlretrieve(aurl, afile)
        #transform Y!S HTML codec from EUC-JP to UTF-8
        bfilename = val + ".utf.txt"
        bfile = open(bfilename, 'w')
        Popen(["iconv", "-f", "EUCJP", "-t", "UTF-8", afile], stdout = bfile)
        bfile.close()
        #upload UTF-8 Y!S HTML to Refine via multipart post
        projname = val + "proj"
        register_openers()
        datagen, headers = multipart_encode({"project-file": open(bfilename), "project-name": projname})
        request = urllib2.Request(UPURL, datagen, headers)
        response = urllib2.urlopen(request).read()
        #get project id from the Refine response
        soup = BeautifulSoup(response.lower())
        for item in soup.findAll('script'):  
            a = re.findall(r"\d+", str(item))
            if a:
                id = a[0]
                break
                time.sleep(2)
                print id
        #make Refine extract sumo stats from Y!S HTML via JSON
        URL1 = URL1.replace('PROJID_', id)
        HEAD1['REFERER'] = HEAD1['REFERER'].replace('PROJID_', id)
        res = request2Refine(URL1, OP1, HEAD1)
        time.sleep(1)
        #download sumo stats in CSV format from Refine
        OP2 = OP2.replace('PROJID_', id)
        URL2 = URL2.replace('PROJNAME_', projname)
        HEAD2['REFERER'] = HEAD2['REFERER'].replace('PROJID_', id)
        res = request2Refine(URL2, OP2, HEAD2)
        time.sleep(1)
        #write sumo stats to CSV file
        cfile = open(val + ".csv", 'w')
        cfile.write(res)
        cfile.close()
        print '--- %s finished' % val
    
if __name__ == "__main__":
    main()

    