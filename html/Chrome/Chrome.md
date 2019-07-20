# Chrome 系列浏览器 

[TOC]

## Cent Chrome 百分浏览器

便携版Cent升级时只需要覆盖升级App文件夹.

### 快捷书签用法

添加或者编辑某个书签，在“网址：”编辑框中写入以 `cmd:` 或者 `cmd://` 开头的命令行，可以写入运行命令（WIN+R）中支持的任意内容。**例如：** 

```shell
cmd:notepad d:\123.txt
cmd:cmd.exe /k ping yahoo.com
```

快捷书签会以红色字体显示，需要执行某个命令时，单击相应的书签即可。

### 如何下载视频

首先打开`设置->高级设置->浏览`, 之后打开视频后，视频右上角有工具条，点击最左边的`在独立窗口中播放`，生成新的窗口后，右下角有下载可以点击。



### 如何配置高分屏

找到如下设置，`设置 -> 高级设置 -> 忽略系统 DPI 设置`，将其点成`未选择`，重启浏览器即可。



### chrome 同步密码

在清除浏览记录的选项中不要点选**密码和其他登录数据**, 否则下次打开浏览器会自动同步空的密码管理, 使得所有密码丢失.



### 解决卡顿

在版本 4.0.9.112 经常会卡顿, 解决方案:

1. 把 `chrome://flags/#smooth-scrolling` 改为 `Disabled` 试试
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
* [Markdown Previewer](https://chrome.google.com/webstore/detail/markdown-viewer/ckkdlimhmcjmikdlpkmbgfkaikojcbjk?hl=en): 预览Markdown文件
* [简悦](https://chrome.google.com/webstore/detail/simpread-reader-view/ijllcpnolfcooahcekpamkbidhejabll/): 沉浸阅读模式, 也可以识别阅览 Markdown 和 LateX.
* [暴力猴](https://chrome.google.com/webstore/detail/violentmonkey/jinjaccalgkegednnccohejagnlnfdag): 更好的[Tampermonkey](http://tampermonkey.net/)替换品
* [LastPass](https://www.lastpass.com/zh)：密码管理
* [Stylish](https://userstyles.org/)：更改网站的样式。
* [Aria2 for Chrome](https://chrome.google.com/webstore/detail/aria2-for-chrome/mpkodccbngfoacfalldjimigbofkhgjn)：Aria2下载界面, 后者更高效
* [Google Mail Checker](https://chrome.google.com/webstore/detail/google-mail-checker/mihcahmgecmbnbcchbopgniflfhgnkff)
* [Markdown Here](https://markdown-here.com)
* [Zotero Connector](https://chrome.google.com/webstore/detail/zotero-connector/ekhagklcjbdpajgpjgmbionohlpdbjgc)
* [Makedown](https://chrome.google.com/webstore/detail/makedown/hjhdlmnpinhhbonjckafaeaacblilpkc): 知乎专栏和知乎输入公式
* [Proxy SwitchyOmega](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif): 代理切换
* [NetEaseMusicWorld+](https://chrome.google.com/webstore/detail/neteasemusicworld%20/pjcgkmiglhiambjngnljkdpoggonlnfe): 网易云音乐海外
* Grammarly for chrome



### 暴力猴脚本

下述全部插件可以在[Greasy Fork](https://greasyfork.org/zh-CN)的[我的收藏列表](https://greasyfork.org/zh-CN/scripts?set=323311)中查看, 绑定谷歌登录. 

暴力猴的网盘同步有时候会出现问题, 可能是某些插件名的`非合法`字符引起的.

- [Baidu Encyclopedia to wikipedia](https://greasyfork.org/zh-CN/scripts/20134)
- [Yet Another Weibo Filter 看真正想看的微博](https://greasyfork.org/zh-CN/scripts/3249): 过滤微博；修改版面
- [网盘助手](https://greasyfork.org/zh-CN/scripts/378301): 下载, 播放, 自动填写密码
- [简悦-轻阅版](https://greasyfork.org/zh-CN/scripts/39998): 暴力猴需要安装github的[simpread.js](https://raw.githubusercontent.com/Kenshin/simpread-little/master/src/userscript/simpread.js).
- [豆瓣资源下载大师](https://greasyfork.org/zh-CN/scripts/329484): 豆瓣电影, 图书等资源下载
- [AC-baidu](https://greasyfork.org/zh-CN/scripts/14178): 百度谷歌优化
- [优惠购](https://greasyfork.org/zh-CN/scripts/378081): 或者购物党
- [复制为Markdown格式](https://greasyfork.org/zh-CN/scripts/370299): 复制网页为 Markdown (使用 turndown.js)
- [知乎答案复制为markdown格式](https://greasyfork.org/zh-CN/scripts/370215): 方便复制知乎回答
- [iciba划词翻译](https://greasyfork.org/zh-CN/scripts/6303): 非常好的网页翻译
- [拒绝二维码登录](https://greasyfork.org/zh-CN/scripts/27183): 默认使用账号密码登录而不是二维码
- [小说阅读脚本](https://greasyfork.org/scripts/292/): 小说阅读优化
- [知乎重排for印象笔记](https://greasyfork.org/zh-CN/scripts/372064): 方便复制和打印的知乎问答和专栏
- [解析 91](https://greasyfork.org/zh-CN/scripts/378608): 精力是有限的
- [斗鱼去火箭横幅](https://greasyfork.org/zh-CN/scripts/381934): 斗鱼精简且去火箭横幅, 加很多小功能
