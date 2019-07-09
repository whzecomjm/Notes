Listary Notes
===

## 常见问题及解决

### 5.0 版本

1. 5.0版本不要用管理员权限启动 Listary。

2. 出现感叹号的历史纪录可以选择清除历史纪录

3. 搜索文件时在最后插入空格就不会显示应用.

4. 更多参考内容参见 [Listary 官方文档中文版- 知乎](https://zhuanlan.zhihu.com/p/24897629).

   

### 6.0.2.14 更新

- 命令支持全局快捷键。
- 直接打开 URL。
- 打开搜索过滤器所在目录。



## Listary 自带快捷键

| 快捷键            | 快捷键作用                         |
| ----------------- | ---------------------------------- |
| Ctrl+Ctrl / Win+Y | 打开 Listary 工具条                |
| Ctrl+Alt+M        | 显示弹出菜单                       |
| Ctrl+O            | 动作                               |
| Ctrl+N/P          | 下一个/上一个项目                  |
| Ctrl+G            | 切换到文件管理器中正在浏览的文件夹 |
| Ctrl+Shift+O      | 直接打开文件管理器中选中的文件     |
| Ctrl+Shift+E      | 浏览当前文件夹 （在文件管理器中）  |
| Ctrl+Shift+E      | 使用 Notepad3打开（在工具条中）    |
| Ctrl+Shift+C      | 复制选中的文件路径到粘贴板         |
| Ctrl+Shift+X      | 显示/隐藏文件后缀名                |
| Ctrl+Shift+H      | 显示/隐藏隐藏文件夹                |



## 使用 AHK 把快捷键改为 Win

如果使用 Listary 5.0 可以下载**[ListaryWithWinKey](https://github.com/KevinWang15/ListaryWithWinKey)**。

1. 在快捷键中, 把显示 Listary 工具条快捷键设置为 `Ctrl+Shift+Alt+Win+F`. (五个键同时按) (这保证了这个快捷键不会和别的快捷键冲突）。

2. 用管理员权限运行程序 ListaryWithWinKey.exe(双击后会自动索要管理员权限)。
3. 按 Win 打开工具条，再按一次 Win 关闭工具条。



### 禁用和开机启动

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



## 配置 XYplorer 等其他文件管理器

在 Listary 常规设置中的"默认文件管理器"自定义, 填写路径和参数:

```bash
D:\Program Files\XYPlorer\XYplorer.exe
"%1"
```

注意在 Listary - XYplorer 设置中要关闭 Listary 快捷键.