# Markdown

Markdown是我必要的写作和笔记软件，Windows下有不少优秀的编辑器，比如 Typora, Yu Writer, VNote, [Laverna](https://laverna.cc/), Smark和为知笔记等等；在线的编辑器有 [Makodo](https://www.madoko.net/editor.html)，[Penflip](https://www.penflip.com/), [看云](https://www.kancloud.cn/)等。这些编辑器都可以配合Pandoc使用，非常方便。虽然网上有不少的Markdown的教程，但是写一个自己整理的内容更加便于学习，故一些及其基本的内容省去，只需参照上述链接即可。

Markdown用反斜杠（`\`）来**转义**，表示文本中的markdown符号。在加载js的博客程序或者软件中，所有的符号都是先经过Markdown编译，之后才会进入Latex插件或者MathJax等继续编译，所以要使用一些特殊符号比如反斜杠本身也需要用反斜杠转义，也就是说要输入 `\\` 。大多数离线编辑器都已经克服了这个Markdown语法bug.

Markdown 无序列表可以用减号（`-`）放在行首作为列表标记，注意**起始行上方需要空行**。有序列表则使用任意数字加一个英文句点，编译以后出来的效果都是按顺序1,2,3排下来的。如果要在列表项目内放引用或者子列表，那么新环境需要缩进。**实际上所有的非双层引用嵌套都需要缩进。**

被尖括号`<>`包住的链接或者是邮箱可以自动变成超链接；在Pandoc中如果想要换行，但是不想分段的话，可以在行尾加上两个空格号。在Typora中只要 Shift+Space 即可.

## Madoko 注意事项

本地的Markdown编辑器的特点是加载并不比在线快，所以可以试试 MS Research 开源的 Madoko 在线 IDE 吧。Madoko 除了提供一套强大且系统的 Markdown 语法拓展之外，其输出部分也是很有意思。Madoko 的输出提供 HTML 和 PDF，其中 PDF 部分交给 LaTeX（官方默认配置是 TeXLive XeLaTeX）和 Pandoc 处理。

**CJK 处理指南.** 要优化 Madoko 的 CJK 输出其实很简单。 对于 HTML 输出，使用 html-lang 属性定义 DOM 节点即可（具体参见[知乎回答](https://www.zhihu.com/question/19637157 )）。 事实上我不需要html文件，在线预览不用如此设置，只是导出到PDF文件的时候会遇到一些问题，中文无法显示，只要在默认的标题头中加入一句 `Package:[UTF8]ctex` 即可.



### 各个Markdown编辑器的公式问题总结

大部分的 Markdown 编辑器, 尤其是在线的编辑器最大的问题是 Markdown 和 MathJax 的不完美融合, 会出现一些 Bug. 比如, 公式内的下标`_`有时候会和后续的一个`_`转变为文本强调, 有时候公式内的大括号`\{`无法显示, 公式内换行`\\` 无效等等. 下面列举我用过的编辑器的情况:

- **Madoko**: 没有什么问题, 有更多的特性, 最为强大!
- **Typora**: 基本没有 Bug, 现在在用! 
- **Yu Writer**: 另一款没有Bug的编辑器. 但目前不再更新.
- **VNote**: VNote换行符号和大括号都有bug, 需要转义; 二连续的上下标和乘号只要用空格隔开就能解决.
- **Typecho**: 最新的1.1版本的 Typecho 使用最新的  [HyperDown](https://github.com/SegmentFault/HyperDown/) 数学公式再无bug.
- **Penflip**: [Penflip](https://www.penflip.com) 的数学行内公式必须要使用`\(`，而一般我们都会使用`$`模式. 不过幸运的是，Penflip下载Markdown文件时会自动转码为美元符号。缺点是中国用户体验不佳, 比较卡.
- **看云**: ~~不支持 LaTeX!~~ 现已支持(201908), 未测试, 需要绑定手机才可使用.



## Markdown的一些可能的Bug

### 有关链接

如果是中括号需要引用的内容里使用中括号, 我们可以尽量避免[]内出现中括号, 或者使用转义. 

但是使用链接, 如果链接(或者图片)url内部有小括号(特别是结尾, 常见于维基百科链接), 如果使用转义, 打开链接时也会出现转义符, 所以网址出错. 解决方法:

> ==`%28` 代替`(`, `%29`代替`)`== 主要是后者会歧义链接部分的结束. 这是使用url符号码去代替ascii的符号. 能够解决这个问题, enjoy it!

参考文献: <http://gohom.win/2015/12/24/MD-bracket/>.

