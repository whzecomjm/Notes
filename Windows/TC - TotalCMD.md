# Total Commander 使用经验

[toc]

## 一些我喜欢的快捷键
1. `Ctrl+H` 显示/隐藏隐藏文件
2. `Ctrl+2/3` 或者 `Ctrl+Shift+C` (自定义与listary一样) 复制文件名/文件名及路径
3. `Ctrl+D` 显示常用文件夹
4. `Ctrl+B` 打开选定文件夹所有子文件夹
5. `Ctrl+M` 批量重命名
6. `F10` 比较文件内容
7. `Insert` 或者 `Space` 选择文件
8. `Backspace` 跳到上层目录
9. `Tab` 切换左右窗口
10. `Ctrl+Shift+F5` 或者 `Ctrl+I`创建快捷方式
11. `Ctrl + Z`  编辑文件备注



## 设置 TC 为系统默认的资源管理器

1. 打开注册表：Win+R → regedit

2. 定位 `HKEY_CLASSES_ROOT\Directory\shell`，修改 shell 默认值为 TC
   在 shell 下新建一个子项 `TC`

3. 在 TC 下继续新建一个子项 `Command`，修改默认值为：

   ```bash
   "D:\Program Files\TotalCMD\Totalcmd64.exe" "/R=%1"
   ```


参考文章: [设置 TC 为系统默认的资源管理器](https://zhuanlan.zhihu.com/p/79046588).





## 我的插件列表

### 压缩插件 wcx

使用 `Alt+F5` 压缩对应类型

1. DiskDir (创建lst目录文件)
2. ISO
3. RAR
4. Total7zip
5. TotalRSZ (压缩图片)



### 内容插件 wdx

1. CDocProp
2. Exif
3. FileDiz
4. ShellDetails



### 文件系统插件 wfx

在`网络`文件夹中打开

1. cloudplugin
2. Porocfs (任务管理器)
3. Registry
4. Webdav



### 查看插件 wlx

使用 F3 查看

1. Fileinfo
2. HTMLView
3. ICLView
4. Imagine
5. MarkdownView
6. sLister
7. SqLiteViewer
8. uLister