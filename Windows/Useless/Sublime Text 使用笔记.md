# Sublime Text 使用笔记

## 推荐插件
 
- [Pandoc](https://github.com/tbfisher/sublimetext-Pandoc): Pandoc插件
- [SideBar Enhancements](https://github.com/titoBouzout/SideBarEnhancements): 可以[预览网页](http://riny.net/2014/sublime-view-in-broswer/)。
- [LaTeXTools](https://github.com/SublimeText/LaTeXTools)
- [MarkdownEditing](https://github.com/SublimeText-Markdown/MarkdownEditing)
- [Markdown Preview](https://github.com/revolunet/sublimetext-markdown-preview)
- [Git](https://github.com/kemayo/sublime-text-git)
- [Material Theme](https://github.com/equinusocio/material-theme)
- [SyncedSidebarBg](https://github.com/aziz/SublimeSyncedSidebarBg): 侧边栏颜色的修改方案
 
## 常用快捷键
- `F6`: 拼写检查
- `Ctrl+P`: 根据文件名打开目录（已在ST打开的目录）中的文件，Esc退出选项。
- `Ctrl+R`: 列出文件中所有方法，等于Ctrl+P输入@，md格式则会打开toc目录。
- `Ctrl+D`: 选中下一处与当前选中文字相同的文字，`Alt+F3` 选中所有相同的文字。
- `Ctrl + Shift + P`: 调出命令面板，如选择`View:Toggle Menu`可以找回菜单栏。
- `Ctrl + Shift + L`: 同时编辑多行
- `Ctrl + L`: 选定所在行，重复使用可以多选。
- `Ctrl + Shift + D`: 复制并粘贴当前选中内容, 如果没选中,复制粘贴光标所在行
- `Ctrl + J`: 合并选中的多行代码为一行。
- `Ctrl + [/]:` 向左/右缩进。
- `Ctrl + M`: 光标移动至括号内结束或开始的位置。
- `Ctrl + Enter`: 即使光标不在行尾，也能快速向下插入一行。`Ctrl + Shift + Enter`: 在上一行插入新行。
- `Ctrl+ Shift + K`: 删除所在行。
- `Ctrl+ C/X`: 复制/剪切所在行
- `Ctrl+ Z/Y`: Undo/Redo
- `Ctrl + F`: 查找，`Ctrl + H` 查找替换，`Ctrl + Shift + F` 在文件中查找替换。
- `Ctrl + K + B`: 开启/关闭侧边栏。
- `F11`: 全屏模式，`Shift + F11`:免打扰模式
- 按下__鼠标中键__来进行垂直方向的纵列选择，也可以进入多重编辑状态。
- `Shift + 方向`: 选定，相当于点击鼠标左键拖选。
 
### Markdown 文件快捷键
- `Ctrl + Win + K`: md文件添加链接
- `Ctrl + Win + V`: 粘贴剪贴板内容到链接
- `Ctrl + Win + R`: 粘贴剪贴板内容到定义式链接的内容
- `Shift + Win + K`: md文件添加图片链接
- `Ctrl + Shift + B`: 添加粗体文字
- `Ctrl + Shift + I`: 添加斜体文字
- `Ctrl + 1~6`: 添加标题
 
## 有关MarkdownEditing
 
### 安装MarkdownEditing出现错误
 
Sublime Text 3 通过Package control安装MarkdownEditing后，提示此错误： `error: Error loading syntax file` ，可以通过以下办法[解决](https://www.v2ex.com/t/81563)：Ctrl+Shift+P, 选择：set syntax：MultiMarkdown。 
 
### MarkdownEditing 设置（设置-更多-特定的语法-用户）
 
    {
      "color_scheme": "Packages/MarkdownEditing/MarkdownEditor-Dark.tmTheme", //主题选择
 
      "extensions": [ "md" ],
 
      "highlight_line": true,
      "line_numbers": true,
      "draw_centered": false,  //不居中
    }
 
## 用户配置文件
 
    {
        "color_scheme": "Packages/MarkdownEditing/MarkdownEditor-Dark.tmTheme",
        "font_size": 14,
        "highlight_line": true,
        "hot_exit": false,
        "ignored_packages":
        [
            "Vintage",
            "Markdown" //防止和MarkdownEditing插件冲突
        ],
        "theme": "Default.sublime-theme",
        "update_check": false,
        "word_wrap": "auto"  //自动换行列
    }
 
## 安装Git后无法使用
win7下在sublime text 2/3中安装完git插件后，在显示所在分支的地方出现乱码。解决：把git的路径放到环境变量PATH中，然后重启。
 
## 修改保存文件时的默认后缀形式
 
1. 新建一个空白文件，设置 Syntax - Markdown
2. 然后 Preference > Setting - more > Syntax Specific - User 会打开 Markdown.sublime-settings，然后将下面的内容保存 （文件名应该是：[Packages/User/Markdown.sublime-settings]）
 
        {
          "extensions": [ "md" ]
        }
 
试验下新建 markdown 文件，保存时的后缀是否为 .md
 
[Packages/User/Markdown.sublime-settings]: 如果安装了Mardown插件，则需要更改一个新的文件：Markdown(Standard).sublime-settings。（Markdown和(Standard)之间有空格。）
 
## 参考文献  
- [Sublime Text 3 配置和使用方法](https://www.zybuluo.com/king/note/47271)
- [sublime text 常用设置和插件](http://www.jianshu.com/p/26c054c7f7dc)
- [如何优雅地使用Sublime Text3](http://www.jianshu.com/p/3cb5c6f2421c)
- [Sublime Text快捷键集合](https://gist.github.com/whzecomjm/df61e5173a1ed4c01903)
- [使用Sublime Text编写LaTeX](http://tonghuashuo.github.io/cn/blog/latex-with-sublime-text.html)