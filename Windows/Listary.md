Listary Notes
===

[TOC]

## Listary 5 注意事项

1. 5.0版本不要使用管理员权限启动 Listary。

2. 出现感叹号的历史纪录可以选择清除历史纪录(重启Listary)

3. 搜索文件时在最后**插入空格**就会排除应用.

4. 更多参考内容参见 [Listary 官方文档中文版- 知乎](https://zhuanlan.zhihu.com/p/24897629).

5. [Listary 中文网](https://www.listarypro.com/): 包括 FAQ 教程等等

6. 一个关于搜索的好文章 [打造一款像谷歌那样的本地搜索引擎]( https://www.runningcheese.com/local-search ).

   

## Listary 5 自定义参数设置

- WinSCP 的自定义BIU打开设置参数: `"BIU-putty" /Desktop /UploadIfAny`
- 在当前目录打开 Git Status (运行cmd) 参数: `/K cd /d "{current_folder}" & git status`
- 打开回收站 (explorer) 参数: `::{645FF040-5081-101B-9F08-00AA002F954E}`
- 在此目录使用 Everything 搜索参数: `-search {query} -path . `
- 默认文件管理器 TC 参数: `/O /T /L="%1"` 
- 默认文件管理器 xyplorer 参数 : `"%1"`



## Listary 自带快捷键

| 快捷键       | 快捷键作用                         |
| ------------ | ---------------------------------- |
| Ctrl+O       | 动作                               |
| Ctrl+N/P     | 下一个/上一个项目                  |
| Ctrl+G       | 切换到文件管理器中正在浏览的文件夹 |
| Ctrl+Shift+O | 直接打开文件管理器中选中的文件     |
| Win + N      | 使用 Notepad3 编辑（AHK+Listary）  |
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

```ahk
~LWin Up::
{
	Send {Ctrl}
	sleep 50
	Send {Ctrl}
}
```

参考链接: [ListaryWithWinKey](https://github.com/KevinWang15/ListaryWithWinKey/blob/master/auto_hot_key_solution.ahk).


