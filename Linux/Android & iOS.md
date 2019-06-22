# 手机小技能 Android & iOS

## Android 修改hosts注意事项


android下修改hosts文件不起作用（无效）的解决办法。首先请确认你修改的是文件是 `/system/etc/hosts` ，如果不是，那你即使改了也无效。


其次，如果你是在windows下修改hosts文件，那就必须注意换行符的问题，以及hosts文件格式的问题： android下的hosts文件必须像以下这样写：


> IP 域名


在IP和域名之间保留一个空格 每行只能有一个域名，不能一个IP后面跟多个域名。

android上的换行符(也就是回车)是LF，也就是\n，而windows上的换行符是CR LF，也就是\r\n

所以在windows下用记事本之类的软件编辑了hosts文件，放到手机上肯定认不出来的！解决的办法就是用NotePad++之类的文本编辑器，再使用“查找替换”，将“\r\n”替换成“\n”（注意要在notepad++里把查找模式设置为扩展模式，才能识别转义字符\r\n）

如果是在windows下编辑hosts，要保证最后一行结尾也是“\n。



## 把iOS的Safari默认搜索地址改为谷歌


中国用户大概很多人都碰到同样的问题，iPhone或iPad的Safari浏览器右上角工具栏处有个搜索框，在里面输入文字可以直接搜索，默认情况下是google，问题是这个google往往（确实不是每次）指向google.cn，由于众所周知的原因，google.cn其实已经没法用了，还得手工点一次“使用google.com.hk搜索”的文字，非常不方便。


解决这个问题的办法是：`设置- 通用- 国际- 地区格式 – 选择 ”United States”`，默认搜索地址就变成google.com了！



##  怎样去除华为的相机拍照声音和对焦声音


修改路径是`system--media--audio--ui`,找到`camera-click.ogg`这个文件，我们可以将这个文件删除，或者重命名该文件为camera-click.ogg1。

参考：[ 怎样去除华为的相机拍照声音和对焦声音 ](http://jingyan.baidu.com/article/cdddd41c521c0d53cb00e10a.html)

