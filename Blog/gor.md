# Gor


感谢你使用Gor编写博客。文件开头是当前文章的元数据

1. date为自动生成, 当然,你可以修改,这是你的自由
2. permalink 可以是固定地址,也可以由gor为你自动生成
3. categories 就是分类, 可以多个
4. tags 同理,多个标签也是很常见的

## 使用方法

请确保文件使用UTF8 without BOM编码，使用方法如下：

	gor post 文章标题 // 新建一篇博客
	gor compile //编译
	gor http //预览
	gor preview //监视文章变动的预览

然后打开你的浏览器,访问 http://127.0.0.1:8080 来预览

## 其它隐藏技巧

-  在根目录新建`others`文件夹，放置于此的文件编译后会自动添加到`compiled`文件夹。
-  在文中使用`{:toc}`即可调用目录，在config.yml添加如下代码后可以更改目录名为中文名`目录`：
       markdown:
         toc_title: '<h1>目录：</h1>'

你将使用Markdown来编写博客
-------------------------

[Markdown 语法中文版](http://wowubuntu.com/markdown/) 能让你快速入门其语法，相信[MarkdownPad](http://markdownpad.com)或[liteide](http://code.google.com/p/liteide/)会是你的编写博客的好帮手。

用gor编写博客将会是一件很开心的事,如果有任何意见或建议,欢迎到 [gor的官网](http://github.com/wendal/gor) 提交issue。
