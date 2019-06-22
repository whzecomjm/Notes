aria2 使用手册
===

## 常用指令

1. 从Web上下载：`aria2c http://example.org/mylinux.iso`
2. 从两个源下载：`aria2c http://a/f.iso ftp://b/f.iso`
3. 用两个连接下载：`aria2c -x2 http://a/f.iso`
4. BitTorrent：`aria2c http://example.org/mylinux.torrent`
5. 磁链下载：`aria2c 'magnet:?xt=urn:btih:248D0A1CD08284299DE78D5C1ED359BB46717D8C'`
6. Metalink：`aria2c http://example.org/mylinux.metalink`
7. 下载文本中的链接：`aria2c -i uris.txt`

## 使用AriaNg客户端

1. 下载最新版的 [Aria2 源码/程序下载](https://github.com/aria2/aria2/releases/latest)
2. 下载并解压 [aria2 懒人包](http://aria2c.com/archiver/aria2.zip)，将最新版的程序aria2c.exe 替换懒人包的相应程序。
3. 懒人包中有配置文件，或者参见更详细的[配置示例下载](http://aria2c.com/archiver/aria2.conf)。
4. 下载[AriaNg](http://ariang.mayswind.net/zh_Hans/)
5. 打开aria.exe后台，打开AriaNg的网页(或者直接使用[aria2c](http://aria2c.com/)官方网站的网页)，现在就可以使用了。


## 参考文献

1. [官方网站](http://aria2.github.io/)
2. [Aria2 & YAAW 使用说明](http://aria2c.com/usage.html)
3. [AriaNg官方说明](http://ariang.mayswind.net/zh_Hans/)
4. AriaNg运行中文需要让chrome设置[允许访问本地文件(异步加载本地文件)](https://jingyan.baidu.com/article/454316ab171c32f7a6c03a53.html)。