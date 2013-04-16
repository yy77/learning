import requests

r = requests.get("http://www.csdn.net")
h = r.headers
for k in h.keys():
    print k + " : " + h[k]

