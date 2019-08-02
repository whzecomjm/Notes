#!/usr/bin/env python
# coding: utf-8

from urllib import request
from bs4 import BeautifulSoup
import re

url='https://ss.freeshadowsocks.biz/'

# proxy={'http':'http://localhost:80'}
headers = ("User-Agent"," Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36")  #这里模拟浏览器  
opener = request.build_opener()  
opener.addheaders = [headers]
request.install_opener(opener)
# 添加 header 模拟浏览器, 可兼容 urlretrieve.

contents = request.urlopen(url).read().decode()
soup = BeautifulSoup(contents,"html.parser")
n=1
for tag in soup.find_all('div',class_='shot-item'):
    img = tag.find('a').get('href')
    imgurl = url+img
    print(imgurl+"\n")
    if n<=3:
        imgdir = 'D:/Desktop/'+'ss-%d'% n+'.png'
    else:
        imgdir = 'D:/Desktop/'+'ssr-%d'% int(n-3) +'.png'
    request.urlretrieve(imgurl,imgdir)
    n=n+1

# urlretrieve 用来保存文件, py3 在 urllib.request内, py2在urllib




