Listary Notes
===

[TOC]

## Listary 5 注意事项

1. 5.0版本不要使用管理员权限启动 Listary。
2. 出现感叹号的历史纪录可以选择清除历史纪录或重启Listary。
3. 搜索文件时在最后**插入空格**就会排除应用.
4. 更多参考内容参见 [Listary 官方文档中文版- 知乎](https://zhuanlan.zhihu.com/p/24897629).
5. [Listary 中文网](https://www.listarypro.com/): 包括 FAQ 教程等等
6. 一个关于搜索的好文章 [打造一款像谷歌那样的本地搜索引擎]( https://www.runningcheese.com/local-search ).




## Listary 5 在高分屏模糊的解决方案

虽然使用 `系统(增强)` 缩放等级可以让Listary 更清晰, 但是这会继承在用 Listary 打开的程序，比如 Typora，使得后者显示效果不佳。正确做法是自定义系统的缩放与布局为125%，而不是选择默认自带的125%。

## Listary 5 自定义参数设置

| 调用程序                   | 调用参数                                   |
| -------------------------- | ------------------------------------------ |
| WinSCP-BIU                 | `"BIU-putty" /Desktop /UploadIfAny`        |
| Git Status (当前目录, cmd) | `/K cd /d "{current_folder}" & git status` |
| Everything (当前目录)      | `-search {query} -path . `                 |
| FileLocator (当前目录)     | `-d "%path%" -c "{query}"`                 |
| 打开回收站                 | `::{645FF040-5081-101B-9F08-00AA002F954E}` |
| 默认文件管理器 TC          | `/O /T /L="%1"`                            |
| 默认文件管理器 xyplorer    | `"%1"`                                     |
| GoldenDict                 | `{query}`                                  |





## Listary 自带快捷键

| 快捷键       | 快捷键作用                         |
| ------------ | ---------------------------------- |
| Ctrl+O       | 动作                               |
| Ctrl+N/P     | 下一个/上一个项目                  |
| Ctrl+G       | 切换到文件管理器中正在浏览的文件夹 |
| Ctrl+Shift+O | 直接打开文件管理器中选中的文件     |
| Ctrl+Shift+E | 使用 Notepad3 编辑                 |
| Ctrl+Shift+C | 复制选中的文件路径到粘贴板         |
| Ctrl+Shift+X | 显示/隐藏文件后缀名                |
| Ctrl+Shift+H | 显示/隐藏隐藏文件夹                |



## 使用 AHK 把快捷键改为 Win

如果使用 Listary 5.0 可以下载**[ListaryWithWinKey](https://github.com/KevinWang15/ListaryWithWinKey)**。

1. 在快捷键中, 把显示 Listary 工具条快捷键设置为 `Ctrl+Shift+Alt+Win+F`.
2. 用管理员权限运行程序 ListaryWithWinKey.exe(双击后会自动索要管理员权限)。
3. 按 Win 打开工具条，再按一次 Win 关闭工具条。
4. 禁用和开机启动: 
	- 运行 Configurator.exe 并点击 Stop 可以禁用此功能。
	- 运行`Configurator.exe`并在`Start on boot`中点击`Enable`则可以开机启动。



### Autohotkey 实现

```
~LWin Up::!+^#f
CapsLock::!+^#f  ;capslock 映射成 Listary 激活键
```

参考链接: [ListaryWithWinKey](https://github.com/KevinWang15/ListaryWithWinKey/blob/master/auto_hot_key_solution.ahk).


