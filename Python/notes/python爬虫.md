
## Python3爬虫总结

### 1. 基本原理

基本原理，一行代码就能表示，要先导入urllib模块

```python
import urllib.request
html = urllib.request.urlopen('http://www.baidu.com').read()
print(html)
```
这就表示用urlopen来打开百度首页，读取内容并打印出来。但是这样我们看到的都是二进制代码，需要decode一下

```python
import urllib.request
html = urllib.request.urlopen('http://www.baidu.com').read().decode('utf-8')
print(html)
```
这样打印出来的就正常了，和我们用chrome查看的源码一样了。

### 2. cookie 和 代理(proxy)

#### 2.1 cookie

python的cookie主要是http.cookiejar模块

```python
import http.cookiejar
cj = http.cookiejar.CookieJar()
cj = urllib.request.HTTPCookieProcessor(cj)
```
获取cookie后还可以保存cookie，使用`http.cookiejar.FileCookieJar()`。
此时`http.cookiejar.CookieJar()`需要用`http.cookiejar.MozillaCookieJar()`（用这表示使用Mozilla的cookie方式存储和读取）和`http.cookiejar.LWPCookieJar()`（这表示 Set-Cookie3 文件格式存储和读取）代替，具体看官方文档。

#### 保存和读取cookie

```python
import http.cookiejar
cj = http.cookiejar.MozillaCookieJar()
cj = urllib.request.HTTPCookieProcessor(cj)
#保存cookie到cookie.txt 文件
cj.save('cookie.txt')
#从cookie.txt中读取cookie
cj.load('cookie.txt')
```

#### 2.2 代理

有时需要使用代理，使用
`proxy = urllib.request.ProxyHandler({'http':'127.0.0.8:1080'})`
里面是个字典，当然可以设置不止一个代理。

#### 2.3
设置cookie和代理之后，不能立即生效，需要更改打开网页的方式，也就是

```python
opennr = urllib.request.build_opener(cj,proxy)
urllib.request.install_opener(opener)
urllib.request.urlopen('http://www.baidu.com')
```

这样打开网页就能处理cookie和代理了。

### 3. 模拟浏览器及登陆

很多网站禁止了类似python的爬虫，所以需要模拟浏览器浏览，有的网站更是需要登陆才能浏览。

模拟浏览器主要是增加一个headers，在chrome浏览器上按下f12，就可以看到如下的headers信息。(Network->Documents->Headers)

我们需要增加的就是这个信息，一般添加其中的User-Agent就行了，这就能表示是是浏览器在浏览，有的还需要添加Referer。
headers的增加可以直接
`opener.addheaders=[('User-Agent','Mozilla/5.0 ...']`
也可以采用下面的方法：

```python
req = urllib.request.urlopen(url)
#添加Referer
req.add_header('Referer', 'http://www.python.org/')
添加User-Agent
req.add_header('User-Agent', 'Mozilla/5.0 ...')
```

对于需要登陆的还需要data，包括用户名、密码之类的。

查看所登录的网站需要哪些数据，一般的网页可以直接使用chrome的f12查看，对于会跳转的，需要借助其他的抓包工具，类似wireshark等。

### 4. 获取内容
有了上面的步骤，获得网页的源码，现在可以提取所需要的内容了。
这里可以使用python自带的字符串处理、正则表达式或者BeautyfulSoup4 。
主要教程：

- [正则表达式30分钟入门教程](http://deerchao.net/tutorials/regex/regex.htm)
- [Beautiful Soup 4.2.0 文档](http://www.crummy.com/software/BeautifulSoup/bs4/doc/index.zh.html#beautiful-soup-4-2-0)
- [Vaayne的修行之旅](http://www.vaayne.com/2015/12/08/ciowstpdg000eyt3l737tei1z/)