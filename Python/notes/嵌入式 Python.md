# 嵌入式Python : 如何在U盘安装绿色版 Python

一直以来都习惯将各种日常工具和开发环境变为绿色版。portable，一个U盘就能将日常所用到的开发环境和必备资料随身携带，从公司到家里，再也不用背上重重的笔记本，通勤路上也能轻轻松松的听听音乐，看看kindle了。

Python在Windows下是提供了安装包，安装后也能简单的拷贝出来，形成portable的绿色版本。但如果想把自己写的脚本和环境一起拷贝给别人，然后让他们直接点击就能执行，安装出来的python就显得有点臃肿了，居然占到了130多M，里面存在很多开发才用到的资源。

上Python官网一看, 果然发现了`embeddable`的嵌入式版本，解压出来才12M。我们只需要把这个包解压到自己的发行文件夹里,就能使用python执行基本功能了。而如果自己的项目代码需要依赖某些包，也可以放到项目的lib下进行加载，这样就能够只安装必要的依赖，得到一个最小的发行包。  

而如果想用这个嵌入式包直接作为开发环境,也是可以的,因为为了减小体积是没有预置pip的, 所以如果想和正常的安装版本一样用,我们需要安装pip。

  

**1\. python嵌入包的下载**

[Python Releases for Windows](https://www.python.org/downloads/windows/) 找到最新稳定版本的 “Download Windows x86-64 embeddable zip file”，即可下载。

解压到自定义的目录，如C:\\python364，将python的所在目录 C:\\python364 和 C:\\python364\\Scripts加到PATH中，以方便未来使用。



**2、安装pip**

pip是最方便的python依赖包安装器，在python3.4开始就进行了内置，不过因为我们下载的是嵌入式版本，为了追求最小化，没有进行内置，需要手工安装

1）从 [https://bootstrap.pypa.io/get-pip.py](https://bootstrap.pypa.io/get-pip.py) 下载 `get-pip.py`，放到python目录下

2）重要: 修改python36.\_pth文件，去掉 #import site 前的 #号，即放开 import site；若不放开将会pip无法正确安装。

3）安装pip，执行 python `get-pip.py`.

4）成功后，即可用类似 python -m pip install xxx 的方式安装自己的依赖包（xxx替换为自己想安装的模块名）。

这一般情况下就和普通安装版的python环境没什么区别了。偶尔有一些问题是由于嵌入版本的bug和环境依赖，需要针对性解决一下就好了，不想用嵌入版的同学可以直接用普通安装版安装后，拷贝出来，也是可以的。

> 原文链接: https://zhuanlan.zhihu.com/p/33900815