import urllib2, urllib

aoperations ='''engine=%7B%22facets%22%3A%5B%5D%2C%22mode%22%3A%22row-based%22%7D&project=1598251387760&format=csv'''

URL = "http://127.0.0.1:3333/command/core/export-rows/200301.csv"
headers = {'X_REQUESTED_WITH' :'XMLHttpRequest', 'ACCEPT': 'application/json, text/javascript, */*', 'CONTENT-TYPE':"application/x-www-form-urlencoded",'Origin':"http://127.0.0.1:3333", 'REFERER':"http://127.0.0.1:3333/project?project=1598251387760",'USER-AGENT':"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.44 Safari/534.7"}

request = urllib2.Request(URL, aoperations, headers)
response = urllib2.urlopen(request).read()
print response

