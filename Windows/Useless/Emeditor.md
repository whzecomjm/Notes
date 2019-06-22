# Emeditor

## Pandoc in Emeditor

新建一个外部工具，命令用 pandoc.exe (完整路径),初始目录为：`$(Dir)`， 参数如下：

```batch
-s "$(Path)" -o $(Filename).pdf --template=template.tex --latex-engine=xelatex -Vnumbersections
```

如果不需要template则去掉上述参数的关于template和xelatex的两项。可以增加`--toc`达到生成目录的效果。


> 注：上述命令中的`"$(Path)"`的双引号一定要加上，否则在中文路径或者分割路径时无法调用Pandoc

编译完查看pdf可以新建一个外部工具，命令为pdf阅读器的完整路径，参数为`$(Filename).pdf`，初始目录为`$(Dir)`。




## 其他事项


- 有一次遇到Emeditor调用Pandoc工具显示，pandoc程序拒绝访问，重启电脑后不再出现此问题。

- 附件给出自定义的Markdown文件，可以用于创建新文件（参见 右键新建Markdown文件 ），是个好模板。

- Markdown高亮方法，先下载[Markdown语法文件](https://www.emeditor.com/files/markdown-esy/)，之后打开Markdown的设置，在`高亮(1)`中导入esy文件即可。

- 可以选中代码使用`Tab`和`Shift + Tab`缩进和减小缩进。

- 可以选中内容按`ctrl+r`搜索该内容



## 添加右键菜单编辑


使用注册表添加可以 鼠标右键菜单，具体参见 : [鼠标右键菜单EmEditor增加删除](http://1976xyg.lofter.com/post/1cc5971b_7e1f755)，参考代码：


```bash
// 增加鼠标右键编辑
[HKEY_CLASSES_ROOT\*\shell\EmEditor]
@="EmEditor"
[HKEY_CLASSES_ROOT\*\shell\EmEditor\command]
@="D:\\Program Files\\EmEditor\\EmEditor.exe %1"
[HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EmEditor]
@="{DFA0CC7F-D36B-47D1-8EF5-415C1DA53F57}"

// 使用Emeditor编辑AHK文件
[HKEY_CLASSES_ROOT\AutoHotkeyScript\Shell\Edit\Command]
@="\"D:\\Program Files\\EmEditorPro\\EmEditor.exe\" \"%1\""

// 去除鼠标右键编辑
[-HKEY_CLASSES_ROOT\*\shell\EmEditor]
[-HKEY_CLASSES_ROOT\*\shell\EmEditor\command]
[-HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EmEditor]
```



## 关于配置备份

程序目录下的 **eeConfig.ini** 保存注册信息和语法高亮规则，**eePlugins.ini** 保存工具栏样式，**eeCommon.ini** 保存浏览历史，插件和宏列表，自定义工具也保存在其中的**Tools** 键值下，虽然不是明文，能备份就好，这样就可以放心打造自己的编译环境了。**eeLM.ini**是关于注册的也需要备份.

如果反复unregister的话, 可以使用可用的注册码, 清空eeLM.ini, 姓名随意填.

```
DQHZ2-ZWTCU-S5222-6GT6T-QZ4HZ
DKAZQ-R9TYP-5SM2A-9Z8KD-3E2RK
DMAZM-WHY52-AX222-ZQJXN-79JXH
```

更新时, 全部删除再用RegCleaner清理注册表, 再拷贝新的文件, 最后再把上述四个ini文件覆盖进去. 同时记得使用Emeditor的注册表文件加到右键菜单.

## 使用LaTeX 输出 Console

新建一个宏, latexconsole.jsee 内容如下:

```js
editor.ExecuteCommandByID(4451)
```

更多关于在 Emeditor 中更好使用 LaTeX 的内容参见: [Emeditor编译器](http://gerry.lamost.org/blog/?p=315).



## 用EmEditor替换掉Windows自带的记事本方法

Image File Execution Options就是绿色系统映像劫持技术，这个系统映像劫持技术一般在系统病毒上很常见，所以我们这次用的方法也比较另类，用的原理就是用系统映像劫持技术来实现用EmEditor替换掉Windows自带的记事本.

创建一个如下的注册表文件，然后双击导入即可！注意路径要改成你的EmEditor所在的实际路径，最后要空一行：

```shell
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe]
"Debugger"="\"E:\\ProgramFiles\\EmEditor\\EmEditor.exe\" /z" 
```



