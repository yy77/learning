from bs4 import BeautifulSoup as bs
import urllib2
from sys import argv
from sys import exit

#handle argumments
if len(argv) == 1:
    exit("usage: dict the word query against internet.")
script, word = argv[0], argv[1:]
cword = reduce(lambda x, y: str(x) + " " + str(y), word)

#BeautifulSoup4 preparation
html = urllib2.urlopen('http://dict.cn/'+cword).read()
soup = bs(html, "lxml")

#searching for the word
answer = soup.find('div', "layout basic")
# if not search for english word, it should be chinese word which have a different layout
if answer is None:
    answer = soup.find('div', "layout cn")
# situation of cannot find any definitation both way.
if answer is None:
    exit("cannot found definition.")
for x in answer.find_all('li'):
    try:
        print(x.text)
    except Exception as inst:
        continue
