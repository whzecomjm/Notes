# XYplorer

## XYplorer 可以配合 Listary 以及 Everything 使用

在 Listary 常规设置中的"默认文件管理器"自定义, 填写路径和参数:

```bash
D:\Program Files\XYPlorer\XYplorer.exe
"%1"
```

注意在 Listary - XYplorer 设置中要关闭 Listary 快捷键. 关闭Listary快捷键以后, 在xyplorer里面复制路径是`Ctrl+P`, 显示/隐藏文件同样也是`Ctrl+shift+H`.

配合Everything使用的时候, 需要在everything中设置`上下文菜单`,将"打开文件夹"和"打开路径"的命令都改为

```bash
$exec("D:\Program Files\XYPlorer\XYplorer.exe" "%1")
```



## 批量重命名

选定(多个)文件按F2或者Shift+F2可以批量重命名, 重命名方式可以在左下角帮助找到具体办法.



## 自定义预览

`计算机\HKEY_CLASSES_ROOT\CLSID` 获取程序 GUID, 再自己设置.