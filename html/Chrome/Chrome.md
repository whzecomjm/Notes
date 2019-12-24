# Chrome 系列浏览器 

[TOC]

## Cent Chrome 百分浏览器

便携版Cent升级时只需要覆盖升级App文件夹.



### 如何下载视频

首先打开`设置->高级设置->浏览`, 之后打开视频后，视频右上角有工具条，点击最左边的`在独立窗口中播放`，生成新的窗口后，右下角有下载可以点击。



### 如何配置高分屏

找到如下设置，`设置 -> 高级设置 -> 忽略系统 DPI 设置`，将其点成`未选择`，重启浏览器即可。



### chrome 同步密码

在清除浏览记录的选项中不要点选**密码和其他登录数据**, 否则下次打开浏览器会自动同步空的密码管理, 使得所有密码丢失.



### 解决卡顿

在版本 4.0.9.112 经常会卡顿, 解决方案:

1. 把 `chrome://flags/#smooth-scrolling` 改为 `Disabled` 试试 (4.1.7 重新打开)
2. 打开硬件加速功能.



### 字体设置

Chrome 在中文状态下的默认字体设置策略不恰当。实际上，四个默认字体选项都应该设定为西文字体，然后由操作系统 fallback 至中文字体。对于 Windows，我个人建议将四个默认字体选项设置为「Arial、Georgia、Arial、Consolas」或「Verdana、Georgia、Verdana、Consolas」。

> 知乎：https://www.zhihu.com/question/20365811/answer/14908416

我的方案: 微软雅黑、Candara、Verdana、Consolas。



## 浏览器扩展和插件

### Chrome 扩展

已经安装的Chrome扩展

* [uBlock Origin](https://github.com/gorhill/uBlock)：网页去广告
* [Vimium](https://vimium.github.io/): 全键盘的Chrome
* [简悦](https://chrome.google.com/webstore/detail/simpread-reader-view/ijllcpnolfcooahcekpamkbidhejabll/): 沉浸阅读模式, 也可以识别阅览 Markdown 和 LaTeX
* [暴力猴](https://chrome.google.com/webstore/detail/violentmonkey/jinjaccalgkegednnccohejagnlnfdag): [油猴](http://tampermonkey.net/)的优秀替换品
* [LastPass](https://www.lastpass.com/zh)：密码管理，本地可用KeePass使用坚果云同步
* [Stylish](https://userstyles.org/)：更改网站的样式
* [Aria2 for Chrome](https://chrome.google.com/webstore/detail/aria2-for-chrome/mpkodccbngfoacfalldjimigbofkhgjn)：Aria2高效的下载界面, 其他插件如 Aria2助手, 添加到 Aria2之类并不好用。
* [Google Mail Checker](https://chrome.google.com/webstore/detail/google-mail-checker/mihcahmgecmbnbcchbopgniflfhgnkff)：检查Gmail邮件
* [Markdown Here](https://markdown-here.com)：使用Markdown写邮件等等
* [Zotero Connector](https://chrome.google.com/webstore/detail/zotero-connector/ekhagklcjbdpajgpjgmbionohlpdbjgc)：Zotero在线引用扩展
* [Makedown](https://chrome.google.com/webstore/detail/makedown/hjhdlmnpinhhbonjckafaeaacblilpkc): 知乎专栏和知乎输入公式 (0.1.2 已失效, 最新方法参见 [知乎与简书](E:\MdNotes\AppNotes\Markdown\知乎与简书.md)，也可以用Mdnice在线编辑)
* [Proxy SwitchyOmega](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif): 代理切换
* [NetEaseMusicWorld+](https://chrome.google.com/webstore/detail/neteasemusicworld%20/pjcgkmiglhiambjngnljkdpoggonlnfe): 网易云音乐海外，增强模式直接可用。
* [Grammarly for chrome](https://chrome.google.com/webstore/detail/grammarly-for-chrome/kbfnbcaeplbcioakkpcpgfkobkghlhen)：修正语法错误
* [LaTeX2Word-Equation](https://chrome.google.com/webstore/detail/latex2word-equation): 复制 latex 代码到 Word, 可以使用 [codecogs](http://latex.codecogs.com/eqneditor/editor.php) 预览latex, 再右键 LaTeX2Word-Equation 复制, 到Word 复制即可.
* [Web Scraper](https://chrome.google.com/webstore/detail/web-scraper/): 爬虫插件



### 暴力猴脚本

下述全部插件可以在[Greasy Fork](https://greasyfork.org/zh-CN)的[我的收藏列表](https://greasyfork.org/zh-CN/scripts?set=323311)中查看, 绑定谷歌登录. 另一个下载脚本的地方：[Sleazy Fork](https://sleazyfork.org/zh-CN/scripts). 尽量不要使用美化或者去广告的插件，有此类需求直接使用uBlock去除即可。因为<u>使用脚本去除实质上是在加载之后去除，而uBlock的去除是在加载之前完成</u>。

暴力猴的网盘同步(使用 onedrive 比较好, 国内外通用) 有时候会出现问题, 可能是某些插件名的`非合法`字符引起的.

- [Baidu Encyclopedia to wikipedia](https://greasyfork.org/zh-CN/scripts/20134)

- [药方 (YAWF)](https://greasyfork.org/zh-CN/scripts/3249): 过滤微博；修改版面

- [网盘助手](https://greasyfork.org/zh-CN/scripts/378301)

- [网盘直链下载助手](https://www.baiduyun.wiki/install.html): 持续维护版本

- [简悦-轻阅版](https://greasyfork.org/zh-CN/scripts/39998): 暴力猴需要安装Github版本的[simpread.js](https://raw.githubusercontent.com/Kenshin/simpread-little/master/src/userscript/simpread.js).

- [豆瓣资源下载大师](https://greasyfork.org/zh-CN/scripts/329484): 豆瓣电影, 图书等资源下载

- [AC-baidu](https://greasyfork.org/zh-CN/scripts/14178): 百度谷歌优化

- [优惠购](https://greasyfork.org/zh-CN/scripts/378081): 或者购物党

- [知乎答案复制为markdown格式](https://greasyfork.org/zh-CN/scripts/370215)

- [iciba划词翻译](https://greasyfork.org/zh-CN/scripts/6303): 非常好的网页翻译

- [拒绝二维码登录](https://greasyfork.org/zh-CN/scripts/27183): 默认使用账号密码登录而不是二维码

- [小说阅读脚本](https://greasyfork.org/scripts/292/): 小说阅读优化

- [解析 91](https://greasyfork.org/zh-CN/scripts/378608): 精力是有限的

- [本地YouTube下载器](https://greasyfork.org/zh-CN/scripts/369400-local-youtube-downloader)

- [CSDN自动展开+去广告](https://greasyfork.org/zh-CN/scripts/372452)

  



whzecomjm 
2019-12-13



