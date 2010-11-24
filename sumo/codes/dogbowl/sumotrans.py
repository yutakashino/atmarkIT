import os, sys
import urllib

def conv(data):
    u = data.decode('euc-jp')
    print u
    return u.encode('utf-8')

aurl = "http://sports.yahoo.co.jp/sumo/etc/torikumi/201005/"
afile = "201005.txt"
urllib.urlretrieve(aurl, afile)
fobj = file(afile, 'rU')
data = fobj.read()
fobj.close()
data = conv(data)
#afile = 'utf'+afile
#fobj = file(afile, 'wU')
#fobj.write(data)
#fobj.close()
#print afile, "-> converted"
