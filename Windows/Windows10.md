# Win10使用教程

[TOC]

## 系统优化的建议

更多内容可以参见：[Win10服务优化](http://www.w10zj.com/Win10xy/Win10yh_508.html)。下面是我自己总结的优化建议。

1. ==使用Dism++优化系统==: 不要用别的方法优化.
2. 使用Dism++删除缓存以及不必要的预装应用
3. BIOS关闭Legacy启动，开启安全启动
4. 8g内存关闭虚拟内存(`留着`)
5. ~~关闭搜索服务~~, 多次惨痛教训, 优化服务别玩多了, 设为`手动`就好啦. 打开搜索服务和Windows功能的搜索以规避explorer的bug, 仅索引 Indexed 和开始菜单即可.
6. 使用**彻底删除WIN10全家桶**删除一些Win不用的应用和服务, 比如 EDGE, 混合现实门户, 连接, Onedrive.
7. Typora 和 Chrome 使用独立显卡加速, 解决了 Chrome 打开设置卡顿, 看视频卡顿的问题.



## Windows常用快捷键

### Win相关快捷键

| 快捷键 | 快捷键作用 |
|:---|:---|
| Win+S/Q | 搜索应用功能 |
| Win+W | Windows Office Online |
| Win+E|打开文档管理器|
| Win+R|打开运行|
| Win+T|打开任务栏|
| Win+I|打开 Windows 10设置|
| Win+P|打开投影|
| Win+D | 桌面与程序间切换(Win+M则只能单向切回桌面) |
| Win+F|打开Everything搜索 (AHK)|
| Win+L|锁屏|
| Win+X | 相当于右键开始图标，有不少系统高级功能 |
| Win+O |打开 天若OCR (AHK)|
| Win+V |剪贴板|
| Win+B|打开选定任务栏中的状态栏图标|
| Win+N |打开并新建 Notepad (AHK)|
| **Win+Shift+S**/ Ctrl+Shift+A |新的系统快捷截图, 保存在剪贴板. (AHK)|
| Win+Tab|切换窗口，有预览可看到最近打开的文档|
| Win+1～9 | 启动对应任务栏锁定程序程序 |
| Win+方向键 | 上（最大化），下（还原），左右（左右分屏） |
| Win+Ctrl+D/左右方向键 | 新建一个虚拟桌面/切换虚拟桌面 |
| Win + Ctrl + F4 | 删除当前虚拟桌面 |



### 其他快捷键

| 快捷键 | 快捷键作用 |
|:---|:---|
| F2 | 重命名 |
| Shift + Tab | 减少缩进 |
| Alt+F4或Ctrl+W|退出，后者是强制退出更有用 |
| Ctrl+Shift+C | 复制文件路径（Listary） |
| Ctrl+Shift+E | 使用 Notepad 打开文件 |
| Ctrl+Shift+P | 使用 Sumatra PDF 打开 |
| Ctrl+Shift+M | Minipad2 切换/打开 |
| Ctrl+shift+A | ~~Cent 浏览器截图~~ 修改为系统自带截图 |
| **Alt+ A** | 微信截图 (常用可以直接保存文件) |
| Alt + P | 文件(图片)预览 |

更多快捷键参考：

* [15 个一定要会的 Windows7 快捷键](http://www.appinn.com/windows-7-15-keyboard-shortcut/)
* [没有鼠标的日子多亏了我精湛的手操，各种快捷键分享](http://www.cnblogs.com/Wayou/p/shortcuts.html)
* [ListaryWithWinKey](https://github.com/KevinWang15/ListaryWithWinKey)：将快捷键改为Win键。更多listary的功能，参见[Listary 官方文档中文版](./Listary/Listary 官方文档中文版.md).


## 在右键新建菜单中添加 Md文件类型

方法如下:

1. 打开注册表 RegEdit，找到 `[HKEY_CLASSES_ROOT] -> [.md]`
2. 在 `[.md]` 下新建项 `[ShellNew]` (已经有的话需要删除并重建)
3. 在 `[ShellNew]` 下新建字符串值，如果您使用的文件类型，其程序预设为在启动时打开空白文件，就将新字符串名称设定为`NullFile`;  如果您使用的文件类型，其程序在启动时不会自动打开空白文件的话，新建字符串值名称为 `FileName` (或者保持使用NullFile都可以)，键值为模板文件的绝对路径，我的是 `C:\Users\Administrator\Documents\markdown.md`. 

用这种[方法](http://heiybb.com/add-cpp-tpye.hf)，各种文件类型都可以添加。如果你还想要特定软件新建，可以在该软件的项目内部建一个ShellNew，比如`.md > emeditor64.md > ShellNew` 。这也解决了直接在`.md`下新建项不成功的情况。

## 其他问题解决的链接

Win10作为微软的一个旗舰系统有了更多的性质，不过也会有相应更多的问题，有一个网站 [Windows10 Pro](https://www.windows10.pro/category/win10-tutorial/) 十分好，介绍了win10常见的问题：

* [深度系统Win10](http://www.deepinghost.com/win10/)

* [一部分收藏的Baidu经验](http://jingyan.baidu.com/user/nuc/content?tab=favor)

* [知乎: 如何优雅地使用 Windows](https://www.zhihu.com/question/20491886)

* [如何彻底关闭win10的消息提醒](http://jingyan.baidu.com/article/9c69d48f981f1813c9024e09.html)

* [win7中图片无法显示预览缩略图](http://jingyan.baidu.com/article/295430f12aeeec0c7e0050bf.html)

* [用mklink同步任意文件夹](https://wzyboy.im/post/40.html)

* [win10搜索功能不能用](https://jingyan.baidu.com/article/5552ef47e1e789518efbc941.html)

* [Win10家庭版打开组策略方法](https://jingyan.baidu.com/article/647f0115eafbb67f2148a814.html)，记得重启。

* [如何彻底删除或卸载OneDrive](https://jingyan.baidu.com/article/eb9f7b6d6c0183869364e827.html)

* [如何修改Win7新建文件夹默认名称?](https://www.kafan.cn/edu/60998064.html)

* [彻底禁用 Windows Update 服务](https://blog.csdn.net/c_lanxiaofang/article/details/79092521): Win10 会自动打开

* [Windows 10 下 7zip 拖动鼠标选择时鼠标会瞬移/飞走](https://www.v2ex.com/t/411282)： SysListView32 的 bug。解决方案改用 Bandizip，减少显示属性内容。

* [解决Windows10祖传 日志 DistributedCOM 10016 错误](https://nga.178.com/read.php?tid=13817103): 这个日志会导致死机, 使用 RegOwnershipEx 修改注册表权限, 再用 `cmd(admin) - dcomcnfg` 定位组件服务添加用户(包括 whzec, users, administrators) 修改"激活权限", 之后归还注册表权限. 

  




