# Pandoc


[Pandoc](http://pandoc.org/)是文本格式转换的“瑞士军刀”，它可以让很多文档源文件之间转换。现在我用 Markdown 已经十分熟练了，具体的 Markdown 语言的介绍见先前的一篇**Markdown简介**。下面分两个部分讲一讲 Pandoc 的使用。

## Pandoc的使用

先讲Pandoc的使用，首先安装完Pandoc以后需要配置系统路径， `.\Local\Pandoc`，照理来说安装程序是应该会把这个目录添加到Path中去的，但是并不能保证自动添加，因此有时候要将这个目录手动加入到Path中，这样才能在任何的目录下进行调用。

### 生成HTML文件和PDF文件

使用 Pandoc 最主要的功能就是利用它来生成 HTML 和 PDF 文件，用 markdown 文件生成 html 文件，是Pandoc最基本的一个功能，使用起来也是非常简单的。 pandoc 支持加入 css 一起渲染，可以用如下的命令得到带有 css 的 HTML 文件：


```yaml
pandoc in.md -c style.css out.html
```

同样，在安装了 latex 以后，就可以将 markdown 文件转化为 pdf 了，最简单的方式也是(此处用 xelatex 时个人喜好，并且生成的 pdf 比默认的 pdflatex 要小，看起来要好)。当然，要对中文支持的话，就需要用模板来解决了，在编译的过程中可以加入模板文件。


    pandoc in.md -o out.pdf --template=template.tex --latex-engine=xelatex -Vnumbersections --toc --standalone

这时就能生成一个比较完美的 pdf 文件了。模板文件可以放在需要编译的 Markdown 文件夹内，也可以放在系统默认文件夹 `/AppData/Roaming/pandoc/templates/`。需要注意的是，该文件夹默认并不存在，需要自己创建 `pandoc` 和 `templates` 文件夹。

## Pandoc中的Markdown语法

如果你需要强制**换行**，在行尾放上两个以上的空白字元即可。一个反斜线后跟著一个换行字元，同样也有强制换行的效果。原始 markdown 语法在标题之前并不需要预留空白行。Pandoc 则需要（除非标题位於文件最开始的地方）。这是因為以`#`符号开头的情况在一般文字段落中相当常见。

除了标准的缩进代码区块外，Pandoc 也支持了围栏 (fenced) 代码区块的语法。这区块需以包含三个以上波浪线或反引号的一行作为开始.

### 文件标题区块


```yaml
% title
% author(s) (separated by semicolons)
% date
```


也可以使用yaml模式，只不过编译的时候要加上变量 `--standalone`，例子如下：


```yaml
---
title: 'Title'
author:
- 1tong Zhang
date: \today
abstract: |
  This is the abstract.
---
```

### 脚注和行内注释
Pandoc’s markdown 支持脚注功能，使用以下的语法：


```yaml
Here is a footnote reference.[^1]
[^1]: Here is the footnote.
Here is an inline note.^[Inlines notes are easier to write.]
```


### 文章section内链


使用` {#foo} `做内联，可以使用`[](#foo)`引用。还一种更加通用的方式是使用html代码定义一个锚 `<span id="foo">Hello World</span>`。

### 定义
这和 php-markdown-extra 一样，如下例子：

    Apple
    :   Pomaceous fruit of plants of the genus Malus in the family Rosaceae.

### 图片的问题
只要图片显示的名字**不是文件名**（带.png的全名），插入以后会自动有居中，并且显示名字：`Figure 1. XX`。 如果不想显示的话，只需要将 `![XX][1]` 内的 `XX` 改为文件名或者留空即可。在 Typecho，smark 中则自动不显示图片名称，并且需要添加 `<center>` 方可居中。

另，图片地址不能含有中文，否则无法编译，但是markdown文件本身支持中文地址。

### 多行公式的使用
Pandoc 可以在一个**独立段**直接插入 `\begin{eqnarray}` 等环境，也可以在 `$$TeX$$` 内插入 `\begin{aligned}` 来解决。 注意对其的符号前面加入 `&` ，这比 Latex 前后都要加入 `&` 更方便。

## 参考文章
- [神器Pandoc的安装与使用](http://zhouyichu.com/misc/Pandoc.html)
- [Pandoc's markdown(翻译版)](http://pages.tzengyuxio.me/pandoc/)
- [php Markdown Extra](https://michelf.ca/projects/php-markdown/extra/)
- [搭建Pandoc+Markdown写作环境]( http://www.annhe.net/article-3145.html)



whzecomjm 
2014-06-11