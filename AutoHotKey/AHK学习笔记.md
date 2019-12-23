# AutoHotkey学习笔记

现在正在使用的ahk文件是基于很多学习资料，大多数学习的内容都在ahk文件的注释理，具体可以参见 whz.ahk 文件（由于保持更新暂时只同步到坚果云中）。


Shift键的AHK设置会和输入法冲突，所以可以把输入法中英文切换的Shift键改为Ctrl键。

## 最简单的教程
[AutoHotkey](http://www.haiyun.me/tag/autohotkey) 快速输入替换文本，例输入whz后接空格、句号、TAB、Enter会自动将内容替换为 http://www.whzecomjm.com 。

```
::whz::http://www.whzecomjm.com
```

也可以写成：
```
::ono:: 
SendInput http://www.whzecomjm.com 
return
```



## 修改默认ahk编辑器为Emeditor

如何修改默认的编辑器，需要修改注册表 
> HKEY_CLASSES_ROOT\AutoHotkeyScript\Shell\Edit\Command

将其内容改为:

```bash
"D:\Program Files\EmEditor\EmEditor.exe" "%1"
```



## GroupAdd

Win10不能使用GroupAdd方法，该方法如下：   

```ahk
GroupAdd, MyGroup, ahk_class EmEditorMainFrame3
GroupAdd, MyGroup, ahk_class Qt5QWindowIcon
#IfWinActive, ahk_group MyGroup
;some information here
#ifWinActive 
```

等价方法可以使用如下代码（此方法可用于win10）：
```ahk
#If WinActive("ahk_class EmEditorMainFrame3") || WinActive("ahk_class Qt5QWindowIcon") 
;Emeditor,Texmaker,Vnote编辑模式开始。
;some information here
#IfWinActive 
```



## 转义符号

转义符用来表明在其后紧跟着的字符不能像平常那样进行解释。默认的转义符为重音符。不能直接使用反斜杠“`f”等，是因为它是内置的转义，更多可以参见[转义符号](http://ahkcn.sourceforge.net/docs/commands/_EscapeChar.htm)。



| 输入这些字符 | 得到这些字符 |
|:---|:---|
| `, | , (原义的逗号). **注意:** 在命令最后一个参数中的逗号不需要转义, 因为程序知道把它们作为原义处理. 对于 [MsgBox](http://ahkcn.sourceforge.net/docs/commands/MsgBox.htm) 所有参数同样如此, 因为它会智能的处理逗号. |
| `% | % (原义的百分号) |
| 连续两个重音号 | ` (原义的重音符; 即两个连续的转义符产生单个原义字符) |
| `; |  ; (原义的分号). **注意:** <u>仅</u> 在分号的左边有空格或 tab 才需要. 如果没有, 那么它可以被正常识别而不需要转义. |
| `:: | :: (原义的双冒号). 在 v1.0.40+, 不再需要对它们进行转义. |
| `n | 新行 (换行/LF) |
| `r | 回车 (CR) |
| `b | 退格 |
| `t | tab (最典型的水平移位) |
| `v | 垂直 tab -- 对应的 Ascii 值为 11\. 在一些应用程序中可以通过键入 Control+K 让它显示出来. |
| `a | 警告 (铃) -- 对应的 Ascii 值为 7\. 在一些应用程序中可以通过键入 Control+G 让它显示出来. |
| `f | 进纸 -- 对应的 Ascii 值为 12\. 在一些应用程序中可以通过键入 Control+L 让它显示出来. |
| 发送 | 以默认 (非原始) 模式使用 [Send 命令](http://ahkcn.sourceforge.net/docs/commands/Send.htm) 或 [热字串](http://ahkcn.sourceforge.net/docs/Hotstrings.htm) 时, 像 **{}^!+#** 这些字符具有特殊含义. 因此, 要使用它们的原义字符, 必须把它们包围在大括号中. 例如：`Send {^}{!}{{}`。 |
| "" | 在 [表达式](http://ahkcn.sourceforge.net/docs/Variables.htm#Expressions) 中, 原义字符串内的两个连续的引号被解析为单个原义的引号. 例如：`Var := "The color ""red"" was found."`。 |



## 更多AHK教程

更多学习可以参见附件的教程，另学习笔记参考链接：

1. [ahk自动切换中英文符号](http://www.xuebuyuan.com/1643780.html)
2. [AutoHotKey 之美](https://zhuanlan.zhihu.com/autohotkey)
3. [AutoHotKey 快速参考](https://wyagd001.github.io/zh-cn/docs/AutoHotkey.htm)



