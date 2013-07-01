from bs4 import BeautifulSoup as bs
import urllib2
from sys import argv
from sys import exit

if len(argv) == 1:
	exit("usage: dict the word query against internet.")
script, word = argv[0], argv[1:]
cword = reduce(lambda x,y: str(x) + " " + str(y), word)
html = urllib2.urlopen('http://dict.cn/'+cword).read() 
soup = bs(html,"lxml")
answer = soup.find('div',"layout basic clearfix")
if answer == None:
	answer = soup.find('div',"layout cn")
if answer == None:
	exit("cannot found definition.")	
for x in answer.find_all('li'):
	try:
		print(x.text)
	except Exception as inst:
		continue
