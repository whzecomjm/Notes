Zotero
===


本文是相关网络资源和个人使用经验的一些总结，软件使用环境为 Win，Mac 下可做参考。

# Zotero 简介

> Zotero [zoh-TAIR-oh] is a free, easy-to-use tool to help you collect, organize, cite, and share your research sources.

Zotero是一个免费且易用的工具，可以帮助你收集、整理、引用和分享你的研究资讯。

# Zotero 优势

*   数据的组织形式采用树形目录结构，并且是无限层级，有大量的实践和论文证明，这是最适合人类大脑的知识储存方式
*   可以配置为，Zotero服务器仅同步数据库，文档通过软链接指向本地或者网络服务器，几乎是无限制存储空间，数据库同步可以使用Zotero的服务器，而数据文档可以使用第三方的网络存储功能，如：百度盘、dropbox，google driver，iCloud等，甚至是NAS
*   编辑文档使用外部工具，不存在编辑功能不够强大的问题，不够强大你就去装更强大的编辑器好了
*   开源，在世界范围内有很多人用，插件丰富，你不用担心某一天挂了会没人接手

# Zotero 作用

*   收集信息 使用Firefox、Chrome、Safari插件，随手收藏喜欢的网页和参考文献（及其pdf文档），同时也会对网页信息生成快照留存。
*   组织信息 为收藏的条目增加分组；为条目贴上标签。
*   在线同步 方便在多个屏幕（PC，平板，手机等）间同步文献数据库。
*   多用户协作

# Zotero 简单配置

## 文献信息的同步

1.  设置同步账户并取消内置文件同步
    工具->首选项（Windows版本）或Zotero->Preferences（Mac版本），在同步（Sync）一栏注册登录 Zotero 账户，文献库便可以自动同步到Zotero官网。
    zotero免费账户包含300mb同步空间，经测试，zoteo条目的存储并不记录在这300mb以内，但是仍显得太小，故应取消内置文件同步，在首选项->同步->设置中取消文件同步下面两个选项的勾选。

2.  取消自动生成快照
    zotero 默认设置为保存快照，网页快照包含了大量零碎的文件，估计同步起来也会有困难，对于一部分想保留的快照，依旧可以手动保存，所以建议取消自动生成快照。

## 附件同步

Zotero 自身的免费储存空间有限，若附件文件较多几百兆的空间是不够用的，下面提供两种方法使用网盘同步附件且与文献信息保持关联，便于管理使用。

### 1\. 软链接同步

1.  配置数据存储路径，工具->首选项->高级->文件和文件夹中配置数据存储位置为自己创建的某个目录，可起名为Zotero

2.  在百度云同步盘中创建目录Zotero/storage，作为文献资料的实际存储位置

3.  将第2步配置的数据存储位置超链接到第3步创建的云盘中位置，在 cmd 命令行中输入

    ```text
    mklink /j D:\Zotero\storage D:\百度云同步盘\Zotero\storage

    ```

如此便可以将资料保持到百度云中，而Zotero中只需要存储超链接即可。此方法适用于Windows系统和Linux系统。

### 2\. zotfile 插件同步

> **数据存储位置**是zotero本地几乎所有的配置、文献数据库、附件存放的地方，可以说除了可执行文件和插件都在此处。一般来说，并不需要同步。该目录下的storage子目录，存放有本地所有文件格式的附件，我们需要将storage设置为zotfile的监听目录。
> **链接附件的根目录**是zotero保存文件链接的目录，当zotero以文件链接形式保存附件时，会记住在这目录下找相对路径。

1.  配置附件链接根目录
    将**链接附件的根目录**设置为同步盘可以同步的位置

2.  下载安装 zofile
    下载 [zotfile-4.2.6-fx.xpi](https://addons.cdn.mozilla.net/user-media/addons/284723/zotfile-4.2.6-fx.xpi) 插件（百度云 [http://pan.baidu.com/s/1c2iqst6](https://pan.baidu.com/s/1c2iqst6) ） ，工具->插件，按右上角齿轮选择 Install Add-on Form File ...，选中刚刚下载的zotfile-4.2.6-fx.xpi文件进行安装

3.  配置zotfie
    打开ZotFile Preferences ...，General Settings标签页，Source Folder for Attaching new Files设置为数据存储位置下的storage。Location of Files设置为链接附件的根目录。

4.  同步
    开启同步就好了，对于已经存在本地的附件，请选中所有条目，右键Manage Attachments->Rename Attachments。

### 3\. 注意

1.  zotfile 插件同步方法相对软链接方法，实现了跨平台同步且方便更换网盘和目录。
2.  软链接方法向本方法的迁移
    装zotfile，除了附件链接根目录不动，剩下都按照本文叙述来，zotfile重命名后，再修改附件链接根目录。
3.  修改目录/更换网盘
    其实本质还是改目录，将附件链接根目录剪切到新位置，修改附件链接根目录和Location of Files为新位置即可。

# 一些关于 Zotero 的小问题

## 1\. 建立个性化搜索分类

## 2\. 使用 Markdown 添加笔记

1.  在插件中心，安装Markdown here插件，[http://t.cn/8kxA5bG](http://t.cn/8kxA5bG) （百度云 [http://pan.baidu.com/s/1jHCVVAA](http://pan.baidu.com/s/1jHCVVAA) ）
2.  重启后，新建笔记，输入快捷键ctrl+alt+m


## 3\. zotfile 插件

1\. 自动提取注释文本

在Zotero软件界面，对应条目上，单击右键，在弹出对话框选择Extract Annotations，在提取注释的同时，Zotfile在每条注释下还创建了超链接，点开注释文本后面的蓝色超链接，就可以顺利定位到你的笔记位置。在读一篇长达数百页的综述，如Chemical Review以及书籍时，可以先做高亮笔记，导出注释，然后想查阅的时候，直接点击超链接，直达目的页面，非常方便。

2\. 自动重命名附件文本

zotfile Preference -> Advanced settings -> Other Advanced Settings 中，将 Autoatically rename new attachments 选成 Always rename

3\. 添加书籍书籍目录

添加书籍附件文本后，选中文本，右键Manage Attachments->Rename Attachments，即可自动生成目录，Open Link 即可打开对应章节，前提是附件文本中需包含目录信息。

## 4\. 修改笔记行距与字体

默认行距太挤，且文字过小，不便阅读。打开工具->首选项->高级->打开配置编辑器，在搜索栏中键入note 可以看到相的选项：
段落格式定义：extensions.zotero.note.css，双击该名称，在弹出窗口中粘贴如下内容，这样可以使行距比默认的大一些

```text
p {line-height: 1.4; margin-bottom: 2em;} li {line-height: 1.2;} blockquote {margin-left: 4em;}

```

字体大小定义：extensions.zotero.note.fontSize，双击该名称进行设值，如15
重新打开Zotero可以看到修改后的结果。

## 5\. 与 Endnote 的文献互导

1\. Zotero 导入 Endnote

1.  选定文献，右键点选export selected items；如果是导入整个Library或者cellection可在相应图标上右键点选；
2.  在弹出的对话框中选择导出的格式为Refer/BibIX, 选择文件目录，保存文件，格式为.txt;
3.  在 Endnote 中打开一个library，执行files-import；
4.  在对话框中选择刚才的.txt文件, Impott Option 选 Refer/BibIX，Text Translation 选 Unicode(UTF-8)，点确定后即可导入。

2\. Endnote 导入 Zotero

1.  选择文献后，执行files-export；
2.  选择 Output Style 为 Endnote Export，命名后导入，得到.txt文件；
3.  在 Zotero 中执行actions-import，选择得到的文件，点确定即可导入， 上述导入方式仅能实现文献题录的导入。



## 6. Zotero 如何添加文章检索引擎

从 Zotero `首选项` -> `高级` -> `文件和文件夹` 打开数据库文件 ，再打开控制检索引擎的 `locate/engines.json` 文件. 

### 以添加知网检索引擎为例

可以看到，上图中三对 `{}` 括号中的代码代表着三个默认的检索引擎。添加其他检索引擎只需添加类似代码。下文所示代码是知网引擎，在指定位置添加半角逗号以后，将代码复制到自己的 `engines.json` 文件中保存即可。重新打开 Zotero 即可发现知网检索引擎已被添加。

```json
"_iconSourceURI": "http://pubget.com/favicon.ico" 
}, 此处要加英文（半角）逗号，然后从下面开始复制并添加文末位置 

{
 "name": "CNKI Search", 
 "alias": "CNKI",
 "icon": null, 
 "_urlTemplate": "http://search.cnki.net/kns/brief/Default_Result.aspx?code=SCDB&kw={z:title}", 
 "description": "CNKI", 
 "hidden": true, 
 "_urlParams": [], 
 "_urlNamespaces": { 
     "rft": "info:ofi/fmt:kev:mtx:journal",
     "z": "http://www.zotero.org/namespaces/openSearch#", 
     "": "http://a9.com/-/spec/opensearch/1.1/" 
 }, 
 "_iconSourceURI": "http://static.wanfangdata.com.cn/wfks/img/logo_new.png" 
} 
```

对于 IP 用户，可直接添加知网、万方、维普等检索引擎，就可以无忧无虑地下载文献。但对于使用学校代理的用户，需要更改 `_urlTemplate`。添加其他检索引擎事实上也只需重点修改 `_urlTemplate` 中的搜索网址。



# 相关参考

1. [Zotero—知识管理工具](http://weibo.com/ttarticle/p/show%3Fid%3D2309403991789882213049%26mod%3Dzwenzhang%3Fcomment%3D1)
2. [实现Zotero条目和附件的跨平台独立同步](https://github.com/specter119/RefWares/blob/master/zotero/sync.md%23%25E9%2599%2584%25E4%25BB%25B6%25E5%2590%258C%25E6%25AD%25A5)
3. [Zotero+百度云知识管理](https://liuxiangbin.github.io/2016/04/Zotero_baiduyun.html)
4. [参考文献管理工具zotero的使用经验分享](http://blog.sciencenet.cn/blog-619295-958283.html)
5. [Zotero（5）：电子文献管理攻略](http://www.yangzhiping.com/tech/zotero5.html)
6. [Zotero文献管理不完全教程之-Tips](http://blog.sina.com.cn/s/blog_565e747c0101d689.html)
7. [Zotero与Endnote的互相导入](http://blog.yxwang.me/2008/10/sync-between-zotero-and-endnote/)
8. [“Zotfile插件” — 让Zotero插上翅膀！](https://mp.weixin.qq.com/s%3Fsrc%3D3%26timestamp%3D1495159864%26ver%3D1%26signature%3DpDUkGRw7XGMj0B2Y5LAU8cafjEZt9khqGt-1Fg%2A7Vih8LS9b%2A-dWMSmvgI5q5Tympf3T9ednehFT%2AJ6kinpM69GE4tNgcuRu5sdsgciH2JSLIytzsWiPl9Xe5PhYe-vvDDJIfmekS%2AzNpH0KqQK4oTkQ3GsjvXnsRM6ZKzzdI6c%3D)





原文链接：[知识管理软件 Zotero 的使用](http://chempeng.coding.me/2017/05/07/zotero/)



# 我的经验

1. 文件同步出问题以后可以"重置文件同步历史".

