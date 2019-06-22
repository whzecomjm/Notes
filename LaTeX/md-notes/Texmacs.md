Texmacs 一些使用技巧
===
 
## 参考文献
 
[Texmacs](http://www.texmacs.org/tmweb/home/welcome.en.html) 中使用参考文献要求如下几步：
 
* 写好 .bib文件，并把它放在含 tm 文件的文件夹中。
* 点击 Insert->Automatic->Bibliography，然后输入 bib 文件名。
* 在文档前面引用后面的某些文献，点击 Insert-> Link-> citation-> visible/invisible，再输入相应的文献名，**回车**(这一点很重要啊，我都弄了一上午，就忘了回车)。
* 点击 Document-> Update-> Bibliography，一般来说要点三下，第一下，没反应，第二下，生成了文献列表，但是引用处出现`[?]`乱码，第三次就完美结束了。
 
## 解决启动时无法响应
 
解决启动时无法响应的方法很简单，只需要删除 appdata 相关文件夹即可。2018-1-1 发现的最新版本修复了无法响应的问题。
 
## 如何使用插件
安装好所需插件以后，需要添加一个环境变量，等过一会就会自动生成 session。比如 Pari：
 
    language: pari ;
    Session: default
 
whzecomjm 
2012-11-10
 
> 参考 "官方帮助->用户手册->自动生成的内容"