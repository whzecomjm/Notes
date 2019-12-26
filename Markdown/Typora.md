# Typora 使用指南

[toc]

Typora 默认是所见即所得的 Markdown 编辑器, 不过也能切换**编辑模式**. 编辑视图和所见即所得视图用 `Ctrl+/` 完成, 注意有时候所见即所得视图会出现问题无法编辑此时切换即可(原因不明). 在Typora中, 单独的回车是新开一段，`Shift+回车`是添加段内新行。使用各级标题`#`后面接的内容之前要有空格, 否则无法识别(这是因为开启了**严格模式Strict Mode**, 关闭以后可以消除, 但是养成如此习惯会更好). Typora 还有一些特殊格式, 比如~~删除线~~将使用两个`~~`包围, ==高亮文字==使用两个`==`包围, 使用 `[toc]`能产生目录. :smile_cat:

使用Typora建议新建文档之后再编辑, 否则在没有保存之前，回退(Ctrl+Z)经常会出现问题. 

由于所见即所得的特性, 多种操作都是只要给出 "操作头" 即可做到. 比如任务清单, 我们可以使用`[ ]`,`[x]`来表示完成与否的**清单**， 输入过程中会先产生一个无序列表，直接继续输入` [ ]`即可。同理利用围栏式输入**代码**, 输入三个反引号回车即可，自动会生成一个代码块环境。表格输入只需要输入类似于 `|表格头|表格头2|`的表格头回车即可.

更多关于 Typora Markdown 的内容参见 [Typora Markdown Reference](C:\Program Files\Typora\resources\app\Docs\Markdown Reference.md), 或者参考官方[帮助网页](https://support.typora.io/). 



## 一些有用的快捷键

全部的快捷键参考: [Shortcut Keys](http://support.typora.io/Shortcut-Keys/)。 表中一部分快捷键是我自定义添加或者替换。

| 快捷键                   | 效果                                              |
| :----------------------- | ------------------------------------------------- |
| `Ctrl + D`               | 选中单词(包括它的格式)                            |
| `Ctrl + Shift + D`       | 删除单词                                          |
| `Ctrl + L`               | 选中一行/一个句子                                 |
| `Ctrl + Shift + L`       | 删除选中行                                        |
| `Ctrl + E`               | 选中光标所在那一源代码的一行                      |
| `Ctrl + Shift + C/V`     | 复制为Markdown / 粘贴为纯文本                     |
| `Ctrl + J`               | 跳转到选定的位置(会让选定位置滑动到页面最上方)    |
| `Ctrl + T`               | 添加表格                                          |
| `Ctrl + Enter`           | 添加新行 / 在表格中是增加新的空行                 |
| `Ctrl + Shift + K`       | 添加代码块                                        |
| `Ctrl +` `               | 行间代码                                          |
| `Ctrl + Shift + H `      | 高亮文本                                          |
| `Ctrl + M`               | 添加行内公式，可以直接把没有包裹在$$内的latex转换 |
| `Ctrl + Shift + M`       | 添加行间公式块                                    |
| `Ctrl + Shift + Q`       | 添加引用                                          |
| `Ctrl + Shift + [`/`]`   | 添加有序列表和无序列表                            |
| `Ctrl + B/I/U`           | 粗体, 斜体, 下划线                                |
| `Ctrl + Shift + ` `      | 添加删除线                                        |
| `Ctrl + K`               | 添加链接                                          |
| `Ctrl + Shift + I`       | 添加图片 (Images)                                 |
| `Ctrl + \`               | 清理格式                                          |
| `Ctrl + Shift + T`       | 显示/隐藏侧边栏 (^+1/2/3分别表示大纲,文章,文件树) |
| `Ctrl + /`               | 源代码模式                                        |
| `F8` / `F10`             | 聚焦模式 / 打字机模式                             |
| `Ctrl + Shift + =` / `-` | 放大/缩小                                         |



## 作图

Typora 支持多种工具作图, 可以参见[官方参考](http://support.typora.io/Draw-Diagrams-With-Markdown/). 包括可以使用 [Sequence](https://bramp.github.io/js-sequence-diagrams/), [Flowchart](http://flowchart.js.org/)(流程图), [Mermaid](https://knsv.github.io/mermaid/#mermaid) (序列图, 流程图,甘特图), 最近还支持使用 [gravizo](http://www.gravizo.com/) 画流程图, 参见 [what's new in 9.54](https://support.typora.io/What's-New-0.9.54/).



## 数学和学术功能

Typora 提供丰富的数学公式, 化学式, 交叉引用等有用的[学术功能](http://support.typora.io/Math/). 

- 输入两个美元符号再回车即可得到一个**行间公式**, 点击完成退出公式模式. (也可以用快捷键 ctrl+shift+M 进入). 在设置中还可以打开行间公式的自动编号功能.

- 行内公式需要在设置中打开, 使用两个美元符号包裹公式即可. 输入一个美元符号以后, 按 `Esc` 可以自动补全. (我用ahk改为自动补全)

- Typora 支持 TeX 命令, 这来源于 [MathJax 的支持](http://docs.mathjax.org/en/latest/tex.html#supported-latex-commands) 继承.

- Typora 支持 mhchem **化学式**, 可以再公式内使用 `\ce`, 具体用法参见 [mhchem 的文档](https://mhchem.github.io/MathJax-mhchem/).

- Typora 可使用[交叉引用](http://support.typora.io/Math/#cross-reference), 使用  `\label{}`​ 和 `\ref{}` 即可. 

  

## 重要功能更新

截止0.9.83. 更多更新内容参见 [Release Notes](https://typora.io/windows/dev_release.html), 或者 [本地Change Log](C:\Program Files\Typora\resources\app\Docs\Change Log.md). 

- 支持打开文件夹的**全文内容搜索**(Ctrl+Shift+F)

- **快速打开**, 当前活动目录和最近文件可以通过 Ctrl+P 快速搜索跳转

- 文件树的文件可以通过**拖拽移动**位置

- 9.59 以后**拼写检查**可以使用

- 选中标题, 不再显示源代码, 导致卡顿和误操作 (赞!)

  

## Typora 主题推荐

下面是我觉得好看的主题推荐

- [Academic](https://theme.typora.io/theme/Academic/): 学术主题, 需要适当减少输出pdf宽度
- [zh-Academic](https://github.com/ZJUGuoShuai/zh-academic): 中文学术主题 (导出 pdf 有 bug)
- [Aqua](https://github.com/onemid/typora-aqua):  Green 的夜间主题好看
- [Engwrite](https://theme.typora.io/theme/Engwrite/): 需要适当增大字体
- [Github](https://theme.typora.io/theme/Github/): 默认主题
- [LaTeX](https://github.com/Adarsh-Barik/LatexTyporaTheme)/[LaTeX-zh](https://github.com/Ada-L/LaTeX-likeTyporaThemeforChinese): LaTeX (中文)主题
- [MarkdownHere](https://gist.github.com/xiaolai/aa190255b7dde302d10208ae247fc9f2): 来自其它网站
- [Mirages](https://get233.com/archives/mirages-for-typora.html): 来自个人博主的自用主题, 适合打印
- [Newsprint](https://theme.typora.io/theme/Newsprint/): 需要增加文本宽度
- [Paper](https://github.com/IagoLast/paper): 学术主题, 导出pdf没有 Academic 好看.
- [Pixyll](https://theme.typora.io/theme/Pixyll/): 默认主题
- [Ursine](https://github.com/aCluelessDanny/typora-theme-ursine): Polar 的两色主题好看



whzecomjm
2019-12-26 23:59

