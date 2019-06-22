# 不同的 Markdown 语法

这篇文章属于专题的一部分，详见：[Markdown知识贴](https://sspai.com/p/de1c5a00)  

> 原文链接: https://sspai.com/post/37270.

[TOC]



2.1. 原生Markdown
---------------

Markdown语法最早由John Gruber于2004年创立。为了与后来的衍生markdoon语言区别，这里将其称为原生Markdown。虽然现在使用的Markdown与原生Markdown有所不同，但是衍生的众多Markdown语法也沿袭了很多原生Markdown的语法，学习原生的Markdown对学习Markdown大有帮助，特别是理解Markdown的理念。John Gruber在其个人主页中公布了详细的Markdown语法说明，随着Markdown的推广和传播，这份说明也被广泛传播和翻译，下面提供了相关的网址：   
英文原文：[http://daringfireball.net/projects/markdown](http://daringfireball.net/projects/markdown)   
简体中文版：[http://www.markdown.cn](http://www.markdown.cn/)或[http://wowubuntu.com/markdown](http://wowubuntu.com/markdown)   
繁体中文版：[http://markdown.tw](http://markdown.tw/)

原生Markdown将语法分成区块元素和行内元素：

*   区块元素：段落、标题、区块引用、列表（无序和有序）、区块代码、分隔线
*   行内元素：链接、强调（粗体和斜体）、行内代码、图片

可以看出，原生Markdown支持的元素并不多，连表格都不支持，只支持一些基本的元素。

原生Markdown兼容HTML：为了实现一些Markdown不具备的功能，Markdown中可以使用HTML标签。块级标签必须前后空行，且不能被空格或制表符缩进（即不可被嵌套）。另外，块级标签内不能使用markdown语法。行内标签直接使用。

下面是各部分语法说明的笔记：

### 区块元素

**段落**：段落前后空行   
注意：1）段落与文本行不是一个概念，一个段落中可以包含多个文本行，段落内部可以插入两个以上空格然后回车实现强制换行。2）非嵌套的段落不该用空格或制表符`Tab`缩进。

**标题**：

1.  Setext式（底线形式）：标题下行插入任意数量 `=` （最高阶标题）或`-` （第二阶标题）；
2.  Atx式：标题行首插入1到6个 `#` ，对应到标题 1 到 6 阶。   
    注意：1） `#` 与标题文字间有空格。2）行末可选择性插入 `#` 闭合Atx式标题，不要求数量

**区块引用**：每行行首插入 `>`。   
注意：1）也可以只在段落首行插入 `>`。2）`>`后可不接空格。3）插入多个`>`可以实现区块引用多重嵌套。4）可以嵌套段落、标题、列表、区块代码。

**列表**：

1.  无序列表（unordered/bulleted lists）：使用星号（asterisks）`*` 、加号（pluses）`+` 或是减号（hyphens）`-` 作为列表项目标记。
2.  有序列表（ordered/numbered lists）：使用数字加英文句号作为列表项目标记。

注意：1）列表项目标记后接空格。2）作为列表标记的数字不影响最后输出结果。3)列表项目里的文本行可以用最多3个空格进行缩进对齐，但是不影响最后输出。4）如果两个列表项目间被空行分开，那么这两个列表项目会识别为段落，间隔变大。5）可以嵌套列表（文档没描述，实际可行）、段落、区块引用，方法为每行行首使用4个空格或1个制表符（Tab）进行缩进。6）嵌套的段落可以只在首行使用4个空格或1个制表符（Tab）缩进。7）如果不希望数字-英文句号-空格被识别为列表，可以再英文句号前加入反斜杆`\`。

**区块代码**：每行代码使用4个空格或1个制表符进行缩进。

**分隔线**：在新行中插入3个及以上入减号（hyphens）`-`，星号（asterisks）`*`或下划线（underscores）`_`。

### 行内元素

**链接**：

1.  行内式（inline）：`[文字]（URL "Tittle"）`。   
    注意：Tittle可不添加。
2.  参考式（reference）：`[文字][id]` ，然后在文章任意新行，`[id]: URL "tittle"`。   
    注意：1）tittle可不添加。2）id（链接标记，link identifier）可以使用文字字母、数字、空格、标点符号，不区分大小写。3）如果id空置，自动将链接文字视为id。
3.  自动链接：简单的链接或邮箱地址可以直接用尖括号包裹`<链接或邮箱地址>`

**强调**：

1.  强调（默认斜体）：用一个星号`*`或下划线`_`包裹。
2.  重强调（默认粗体）：文字两边用两个星号`*`或下划线`_`包裹。   
    注意：星号与下划线必须紧贴包裹的文字。

**行内代码**：用反引号（backtick quotes）包裹。   
注意：1）起始的反引号之后与结束的反引号之前可放入空格。2）如果在代码中有反引号，需要多个反引号来包裹。

**图片**：

1.  行内式：`![Alt text](scr)`
2.  参考式：`![Alt text][id]`，在任意新行添加`[id]: scr "title"`   
    注意同链接

### 转义

如果希望键入被语法占用的特殊符号，可以在特殊符号前插入反斜线实现转义。

2.2. 衍生Markdown
---------------

自从John Gruber2004年发布Markdown之后，Markdown进入了自由生长的状态，因为创始人John Gruber打自2004年之后就没有更新过Markdown。因为原生Markdown只是一个轻量级的标记语言，很多功能不具备。为了扩充Markdown的功能，很多Markdown拓展语法被开发出来，其中著名的有GFM、PHP Markdown Extra、MultiMarkdown、Pandoc Markdown等等

### 2.2.1. GFM

原生Markdown发布后，最早在程序员圈内流行。由于Markdown的易读易写，而且对程序员很友好（支持区块代码和行内代码），全球最大的代码托管平台Github引入了Markdown，并且对原生Markdown语法进行了拓展，这种衍生Markdown叫做Github Flavored Markdown，简称 GFM 。

与原生Markdown的主要不同：

*   **采用围栏式（Fenced式）区块代码**：在代码的上下一行用3个反引号` ``` `，可选择性定义代码语种，并支持代码高亮。
    
*   **列表嵌套方法**：改为每次嵌套缩进两个空格。
    
*   **支持任务列表**：在每个列表项目加入`[ ]`，完成任务用 `[x]`，如：`- [x] 任务说明`。
    
*   **支持简单表格**
    
    ```
    |FirstHeader|SecondHeader|
    |-----------|-----------|
    |ContentCell|ContentCell|
    |ContentCell|ContentCell|
    ```
    
    注意：1）两侧的竖线`|`可以省略。2）第二行的每个单元格至少3个减号`---`。3）可以修改每列文字对齐方式，方法`| :--- | :---: | ---: |`。
    
*	**支持使用emoji表情**

*	**删除线（新增）：用两个波浪号`~~`紧密包裹文字。**

还有部分语法专门为Github平台设计的，这里就省略了。详细的GFM说明见：[https://help.github.com/categories/writing-on-github/](https://help.github.com/categories/writing-on-github/)



### 2.2.2. PHP Markdown Extra

与原生Markdown的主要不同：

*   内嵌html：块标签可以缩进不超过3个空格，且可以在块标签中选择性使用markdown语法（方法略）。
    
*   可以为区块元素设置**id和class属性**，实现文章内部跳转，方法略。
    
*   区块代码：与GFM相似，可以使用栅栏方式，在代码上下行用3个或以上波浪号`~`或反引号`` ` ``包裹，亦支持代码高亮。
    
*   表格：同GFM
    
*   支持定义列表：方法略
    
*   **支持脚注**：`[^1]`，在新行`[^1]: 脚注内容`   
    注意：脚注名字必须唯一
    
*   支持缩略语：方法略
    
*   强调：两字词中间的下划线不会被解释成强调。
    

详细的语法说明见：[https://michelf.ca/projects/php-markdown/extra/](https://michelf.ca/projects/php-markdown/extra/)   
简单中文说明：[http://b.soont.com/md/php-markdown](http://b.soont.com/md/php-markdown)

### 2.2.3. MultiMarkdown

原生markdown文档只能从纯文本转换HTML。而MultiMarkdown则是扩大了原生markdown的转换范围，让其可以方便的转换成：

*   HTML/XHTML
*   LaTeX (which can be processed into a PDF)
*   OpenDocument Text document
*   OPML   
    二次转换可以转换成更多格式，比如docx等。   

为了更好地与其他格式的兼容，MultiMarkdown借鉴很多其他的格式的语法功能

与原生语法的主要不同：

*   **支持元数据**：标题、作者、日期等信息，兼容部分YAML。
    
*   支持交叉引用。
    
*   支持添加链接和图片的属性。
    
*   **图片可以作为区块元素**：如果一个图片语言独立成段，会被自动解释为区块元素，图片下会添加一行图片说明。
    
*   支持部分**复杂表格**：兼容PHP Markdown Extra的表格，同时可以——多行表头，单元格横向合并，表格分区，表格下行表格说明等。
    
*   支持脚注：同PHP Markdown Extra中的脚注。
    
*   支持参考文献（Citations）
    
*   支持定义列表：同PHP Markdown Extra。
    
*   支持缩略语（Abbreviations）：同PHP Markdown Extra。
    
*   支持栅栏式区块代码：上下行3到5个反引号包裹代码，可定义语法种类，选择性语法高亮。   
    注意：首尾行的反引号数量要一致。
    
*   支持**MathJax公式**（区块与行内）：区块公式在新行用`\\[`和`\\]`包裹，或首尾用两个dollar`$$`包裹。行内公式用`\\(`和`\\)`包裹，或首尾各用一个dollar`$`包裹。
    
*   支持**上标**与**下标**：上标为单个字符，前面加`^`，为多个字符，用`^`包裹。下标为单个字符，前面加`~`，为多个字符，用`~`包裹。
    
*   支持术语表
    
*   **支持修订功能**（CriticMarkup）：可以显示修订痕迹
    
    *   删除：`{--删除的文本 --}`
    *   添加：`{++新增的文本 ++}`
    *   替换：`{~~删除的文本~>新增文本~~}`
    *   高亮：`{==高亮的文本==}`
    *   备注：`{>>备注文本<<}`
*   内嵌HTML，可在块级HTML中选择性地添加MultiMarkdown语法。
    
*   支持内嵌其他文件，txt、tet、fodt、html等
    
*   换行方式改为行末使用`\`换行。（原生Markdown使用2个空格换行）
    
*   支持**目录**：`{{TOC}}`添加目录
    

详细的语法说明见：[http://fletcherpenney.net](http://fletcherpenney.net/)   
这是语法快速查询表：[https://rawgit.com/fletcher/human-markdown-reference/master/index.html](https://rawgit.com/fletcher/human-markdown-reference/master/index.html)

### 2.2.4. Pandoc's Markdown

Pandoc本身是一个多格式文档的转换工具，所以Pandoc Markdown与MultiMarkdown的设计目的相似，使Markdown可以转换成更多的不同格式，因为Pandoc支持的格式很多，这也就使的Pandoc's Markdown非常的丰富，比如表格就有4种不同的书写方法。

与原生Markdown的主要不同：

*   强制换行支持两种方式：行尾两个空格换行，反斜杆换行。
*   Atx式标题之前一定要预留空行。标题行尾可加标题识别符。
*   区块引用之前一定要预留空行。
*   围栏式区块代码可以用3个以上波浪线或反引号组成的行包裹代码。之前必须留空行。
*   支持行区块
*   不同形式的列表会生成不同的列表
*   支持连续编号的范例清单，范例项目应用与整个文档，不局限与单一清单
*   支持定义列表
*   支持简单表格、多行表格、格框表格和管线表格四种表格样式
*   支持文件标题区块（类似元数据）
*   支持删除线
*   支持上标、下标
*   支持数字公式
*   支持内嵌TeX

详细的语法说明见：[http://pages.tzengyuxio.me/pandoc/](http://pandoc.org/MANUAL.html>http://pandoc.org/MANUAL.html#pandocs-markdown</a> <br>翻译的中文版：<a href=)

### 2.2.5. CommonMark

由于创始人自2004年Markdown诞生之后就没有更新过Markdown语法，众多的遗留问题没有得到解决，加上扩展语法的自由发展和Markdown编辑器的涌现，导致了很严重的方言和兼容性问题。因此有人希望对Markdown语法进行规整和统一，建立一套Markdown的语法规范，而CommonMark正是这样产物。CommonMark与一般的衍生语法不同，它的目的不是扩展Markdown的功能，而是解决原生markdown的遗留问题和方言问题，规范Markdown的书写，成为Markdown的标准。可惜此举得到Markdown创始人John Gruber的强力反对，所以至今CommonMark并没有得到广泛的认可。但是其实就CommonMark本身而言，它规范了Markdown的各项语法，有许多可取之处。CommonMark的语法说明是所有markdown语法说明中最长最详细的，优先问题、缩进问题、空行问题、嵌套问题等等容易出现语法冲突的地方都作了非常详细的说明。

与原生Markdown的主要不同：

*   定义了优先级别：区块语法的优先级别大于行内语法。
*   支持围栏式区块代码
*   支持`1）`作为有序列表的项目标记
*   支持 `\`作为换行符。
*   **列表嵌套采用行首内容对齐，而非4个空格**
*   Setext式标题支持多行

CommonMark基本没有新增内容，主要式对语法规范进行说明，对理解Markdown很有帮助，就是需要一定的Markdown基础，而且英文文档有点长，不好啃动。

详细的语法说明：[http://spec.commonmark.org/](http://spec.commonmark.org/)