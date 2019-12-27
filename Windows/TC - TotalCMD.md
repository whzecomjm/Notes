# Total Commander 使用经验

[toc]

## 一些我喜欢的快捷键
1. `Ctrl+H` 显示/隐藏隐藏文件
2. `Ctrl+Shift+⬆` 复制当前标签到对面
3. `Ctrl+Shift+C` (自定义与listary一样) 复制文件名/文件名及路径
4. `Ctrl+D` 显示常用文件夹
5. `Ctrl+B` 打开选定文件夹所有子文件夹
6. `Ctrl+M` 批量重命名
7. `F10` 比较文件内容
8. `Space` 选择文件
9. `Backspace` 跳到上层目录
10. `Tab` 切换左右窗口
11. `Ctrl+Shift+F5` 或者 `Ctrl+I`创建快捷方式
12. `Ctrl+Z`  编辑文件备注
13. `Ctrl+Q` 另一侧快速预览



## 设置 TC 为系统默认的资源管理器

1. 打开注册表：Win+R → regedit

2. 定位 `HKEY_CLASSES_ROOT\Directory\shell`，修改 shell 默认值为 TC
   在 shell 下新建一个子项 `TC`

3. 在 TC 下继续新建一个子项 `Command`，修改默认值为：

   ```bash
   D:\Program Files\TotalCMD\Totalcmd64.exe /T /R="%1"
   ```


参考文章: [设置 TC 为系统默认的资源管理器](https://zhuanlan.zhihu.com/p/79046588).

> 注1: 直接删除这一注册表以后无法恢复自带资源管理器能力, 一个可行的做法是<u>使用火绒的右键管理禁用TC之后再删除注册表</u>. 
>
> 注2: 这样设置以后可以使用火绒右键管理禁用TC, 结果不会影响到TC的默认文件管理器的地位。 但使用资源管理器打开内部文件夹不会跳转到 TC。
>
> 注3：`%C` 或者`%1`是选中文件名的参数。

## 编辑 TC 工具栏

右键更改工具栏的工具, 在命令右边的小放大镜🔍中选择指令, 或者选择一个外部程序均可.



## 我的插件列表

### 正在使用的插件

- 压缩插件(wcx)：使用 `Alt+F5` 压缩对应类型
  - DiskDir: 用于创建lst目录文件
  - ISO: 打开 iso 镜像文件
  - Total7zip：完整的7zip功能。除了totalzip的文件以外，只需要保留两个dll和exe即可（7z.exe 是命令行版本，不需要也可以删除）
  - TotalRSZ：压缩图片
- 内容插件(wdx)：用于列表显示和浮窗显示
  - FileDiz：显示文件备注
  - ShellDetails：显示所有资源管理器自带属性
- 文件系统插件(wfx)：在`网络`文件夹中打开
  - cloudplugin：支持Dropbox、Onedrive、Google Drive等国外常用网盘
  - Registry：注册表工具
- 查看插件(wlx)：使用 F3 查看
  - Fileinfo：显示exe、dll等文件详细信息
  - HTMLView：预览html文件
  - MarkdownView：预览markdown文件
  - SqLiteViewer：预览sqlite数据库文件
  - JSONViewer：预览json文件
  - Imagine：图片管理和预览工具
  - sLister：使用SumatraPDF预览PDF文件和其他电子书
  - uLister：预览常用文件
- 其他插件：位于Tools或根目录
  - [NewFiles](https://totalcmd.net/plugring/newfiles.html): 批量新建文件和文件夹
  - [QuickSearch eXtended](https://www.ghisler.ch/board/viewtopic.php?f=6&t=22592&sid=858049aa70e211dbab5d1fac5c76e6f3): 支持拼音首字母搜索
  - [F4Menu](https://totalcmd.net/plugring/F4Menu.html)：F4功能的增强版
  - RAR: Rar压缩解压缩



### 其他可用插件

- 内容插件：CDocProp (office 文档信息), Exif (图片exif)
- 文件系统插件：Webdav、Porocfs (任务管理器)
- 查看插件：ICLView (显示ico, 应用程序图标)、[Mmedia](https://totalcmd.net/plugring/mmedia.html) (配合K-Lite 解码器预览多媒体)



whzecomjm
2019-12-27 10:52



