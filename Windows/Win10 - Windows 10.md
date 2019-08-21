# Win10使用教程

[TOC]

## 系统优化的建议

更多内容可以参见：[Win10服务优化](http://www.w10zj.com/Win10xy/Win10yh_508.html)。下面是我自己总结的优化建议。

1. ==使用Dism++优化系统及服务==: 尽量不要用别的方法优化. **不要关闭控制面板的搜索功能**, 搜索服务可以用 Dism++ 关闭. 其他可关闭的[服务](https://www.zhihu.com/question/36192602)有 Connected User Experiences and Telemetry、SysMain （原名为Superfetch，关闭以后会影响应用程序打开速度）. 优化方法参见[这个知乎回答](https://www.zhihu.com/question/33855201/answer/382534840)。

2. 使用Dism++删除缓存以及不必要的预装应用(可以全部删除，包括应用商店)

3. **BIOS**关闭 Legacy启动，开启安全启动; 关闭 Performance Intel SpeedStep, 提高 CPU 功率.

6. 使用 Windows Update Blocker 关闭系统更新

7. 使用**彻底删除WIN10全家桶**删除一些Win不用的应用和服务, 比如 EDGE, 混合现实门户, 连接, Onedrive. (删除 Cortana 会影响系统稳定)

8. Typora 和 Chrome 尽量使用硬件加速, 解决了 Chrome 打开设置卡顿, 看视频卡顿的问题.

9. 出现explorer的快速异常检测失败错误，暂时解决方案是 alt+tab 然后关闭弹出框。

10. 一些不配置高分屏的程序可以使用 `系统(增强)缩放等级` 让其更清晰，比如SpeqMath，ReNamer，RegOwnershipEx 等等。虽然 Listary 使用该方法也能更清晰，但是缩放等级会继承在所有用 Listary 打开的程序: 比如 Typora，到这后者显示效果不佳。

9. *Distributed Transaction Coordinator 服务由于下列服务特定错误而终止*. 实际上这个分布式的服务对于家庭用户[完全不需要](https://www.experts-exchange.com/questions/23039086/The-Distributed-Transaction-Coordinator-service-terminated.html), 可以禁用或者卸载: `MSDTC -uninstall`, 再删掉注册表

   ```shell
   [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSDTC]
   [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MSDTC]
   ```

   

   

## Office 密钥

你的产品: Microsoft Office Pro Plus 2019
你的产品密钥: `GRBR4-J4N3M-KTX9C-JM4PJ-J8HPT`

下载地址: <https://setup.office.com/home/getoffice>



## Windows常用快捷键

### Win相关快捷键

| 快捷键 | 快捷键作用 |
|:---|:---|
| Win+Q/S | 搜索应用功能 |
| Win+E|打开文档管理器|
| Win+R|打开运行|
| Win+T|打开任务栏|
| Win+I|打开 Windows 10设置|
| Win+P|打开投影|
| Win+D | 桌面与程序间切换(Win+M则只能单向切回桌面) |
| Win+F |打开Everything搜索 (AHK)|
| Win |打开 Listary|
| Win+L|锁屏|
| Win+X | 相当于右键开始图标，有不少系统高级功能 |
| F4 |打开/运行天若OCR (AHK)|
| Win+V |剪贴板|
| Win+B|打开选定任务栏中的状态栏图标|
| Win+N |新建 Notepad3 或使用 Notepad3 打开 (AHK+Listary)|
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
| Ctrl/ Ctrl+Space | 微软输入法切换中英文 |
| Shift + Tab | 减少缩进 |
| Alt+F4或Ctrl+W|退出，后者是强制退出更有用 |
| Alt + P | 文件(图片)预览 |

更多快捷键参考：

* [15 个一定要会的 Windows7 快捷键](http://www.appinn.com/windows-7-15-keyboard-shortcut/)
* [没有鼠标的日子多亏了我精湛的手操，各种快捷键分享](http://www.cnblogs.com/Wayou/p/shortcuts.html)
* [ListaryWithWinKey](https://github.com/KevinWang15/ListaryWithWinKey)：将快捷键改为Win键。




## 在右键新建菜单中添加 Md文件类型

方法如下:

1. 打开注册表 RegEdit，找到 `[HKEY_CLASSES_ROOT] -> [.md]`
2. 在 `[.md]` 下新建项 `[ShellNew]` (已经有的话需要删除并重建)
3. 在 `[ShellNew]` 下新建字符串值，如果您使用的文件类型，其程序预设为在启动时打开空白文件，就将新字符串名称设定为`NullFile`;  如果您使用的文件类型，其程序在启动时不会自动打开空白文件的话，新建字符串值名称为 `FileName` (或者保持使用NullFile都可以)，键值为模板文件的绝对路径，我的是 `C:\Users\Administrator\Documents\markdown.md`. 

用这种[方法](http://heiybb.com/add-cpp-tpye.hf)，各种文件类型都可以添加。如果你还想要特定软件新建，可以在该软件的项目内部建一个ShellNew，比如`.md > emeditor64.md > ShellNew` 。这也解决了直接在`.md`下新建项不成功的情况。



## 解决Windows 10祖传日志 DistributedCOM 10016 错误

这个错误会会导致 Windows 10 死机, 我们需要使用 `RegOwnershipEx` 这一软件。

1. 首先打开事件查看器定位10016错误信息，我们有如下日志：

   > 应用程序-特定 权限设置并未向在应用程序容器 不可用 SID (不可用)中运行的地址 LocalHost (使用 LRPC) 中的用户 PC\whzecomjm SID (blabla)授予针对 CLSID 为 {2593F8B9-4EAF-457C-B68A-50F6B8EA6B54}、
   > APPID 为 {15C20B67-12E7-4BB6-92BB-7AFF07997402}
   > 的 COM 服务器应用程序的 本地 激活 权限。此安全权限可以使用组件服务管理工具进行修改。
   
   我们需要记住，用户名和 APPID。

2. 用注册表编辑器找到 APPID，比如 `HKEY_CLASSES_ROOT\AppID\{15C20B67-12E7-4BB6-92BB-7AFF07997402}`, 查看其对应的组件服务名称。

3. 用  `RegOwnershipEx` 释放上述 APPID 的注册表权限。

4. 在组件服务中，打开我们找到`计算机-我的电脑-DCOM配置-组件服务名称`，点击属性-安全，修改"启动和激活权限"，在弹窗中点 Delete, 之后进入以后添加用户(whzec, Users, Administrators)及其权限。

5. 使用  `RegOwnershipEx`归还注册表权限. 

> 参考：[解决Windows10祖传 日志 DistributedCOM 10016 错误](https://nga.178.com/read.php?tid=13817103)



## 其他问题解决的链接

Win10作为微软的一个旗舰系统有了更多的性质，不过也会有相应更多的问题，有一个网站 [Windows10 Pro](https://www.windows10.pro/category/win10-tutorial/) 十分好，介绍了win10常见的问题：

* [深度系统Win10](http://www.deepinghost.com/win10/)

* [一部分收藏的Baidu经验](http://jingyan.baidu.com/user/nuc/content?tab=favor)

* [知乎: 如何优雅地使用 Windows](https://www.zhihu.com/question/20491886)

* [用mklink同步任意文件夹](https://wzyboy.im/post/40.html)

* [win10设置搜索功能不能用](https://jingyan.baidu.com/article/5552ef47e1e789518efbc941.html)

* [Win10家庭版打开组策略方法](https://jingyan.baidu.com/article/647f0115eafbb67f2148a814.html)，记得重启。

* [如何彻底删除或卸载OneDrive](https://jingyan.baidu.com/article/eb9f7b6d6c0183869364e827.html)

* [釋放NVIDIA愛用者的硬碟空間](https://tw.msi.com/blog/%E6%98%A5%E5%AD%A3%E5%A4%A7%E6%8E%83%E9%99%A4%EF%BC%9A%E9%87%8B%E6%94%BEnvidia%E6%84%9B%E7%94%A8%E8%80%85%E7%9A%84%E7%A1%AC%E7%A2%9F%E7%A9%BA%E9%96%93) 

* [Windows 10 鼠标选择时鼠标会瞬移/飞走](https://www.v2ex.com/t/411282)： SysListView32 的 bug。解决方案改用 Bandizip，减少显示属性内容。

* [sfc /scannow是什么意思，有什么作用?](https://blog.csdn.net/cxk207017/article/details/78508344)

  

  

Update by whzecomjm 

2019-07-20 09:59:24

