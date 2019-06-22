# MathJax

## Mathjax 配置方法

在线的Markdown配置时我们需要MathJax以显示数学公式，正如 [MathJax 官网](http://docs.mathjax.org/en/latest/configuration.html#loading-and-configuring-mathjax)给出来的方法一样，我们可以选择用其自带的 CDN 在线加载共式。实际上对于一般虚拟空间来说，这种方式反而比在自己空间安装来得更快。

具体的操作很简单，只需要在主题文件 header.php 的 </head> 之前, 加入如下代码调用代码。下面这个代码是加载 TEX 和 LaTeX 而不考虑 MathML的做法。接下来就是自定义如单个`$`符号表示公式一些配置代码了，如下：

```html
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
	showProcessingMessages: false,
	messageStyle: "none",
	extensions: ["tex2jax.js"],
	jax: ["input/TeX", "output/HTML-CSS"],
	tex2jax: {
		inlineMath: [ ['$','$'] ],
		displayMath: [ ['$$','$$'], ["\\[","\\]"] ],
		skipTags: ['script', 'noscript', 'style', 'textarea', 'pre','code','a'],
		processEscapes: true
	},
	"HTML-CSS": { 
	availableFonts: ["TeX"] , 
	scale: 90, 
	showMathMenu: false
	}
});
MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.3/MathJax.js?config=TeX-AMS_HTML">
</script>
```

上述代码中 output 模式可以改为其他比如 SVG 等等。当然还有更多设置，比如从 2.5 版本之后，还可以设置 Fast-Preview。另外，MathJax的官方 CDN 服务地址也有个基于 SSL 的更安全的 ‘https’。在使用SSL的新博客里需要更新这个地址，否则无法加载公式。

### 关于多行公式的注意事项

1. 在 Typecho 博客中尽量把所有的集成在一起公式写在一行，而不分段, 即使是`eqnarray`或`aligned`公式环境，否则有时候不能正确加载。
2. `aligned`环境可以不欠套在`$$`内也可以实现公式块。

参考: [非常详细的MathJax配置文件](https://www.linpx.com/p/front-end-integration-mathjaxjs-configuration.html).

## 在线 Markdown 和 MathJax兼容的Bug

由于大多数的Markdown笔记软件特别是在线的都是后嵌入MathJax，所以会有一些转义的Bug，比如两个下划线之间如果没有空格会优先渲染加强形成斜体，换行符需要4个`\`等等。具体的bug主要如下：

- 换行符号，需要4个`\`才能换行;
- 大括号，需要两个`\\`之后接上括号才能显示;
- 连续的**上下标**会触发Markdown的自带上下标功能(<sub>, <sup>等)，需要使用 `\` 转义;
- 连续乘法会触发Markdown加强语句;
- 井号需要输入`\\#`;
- 其他的特殊符号，比如小括号里的 `c,r,p` （包括大写）等等.

直接转换的办法: [批量修改多个文件内容的脚本](https://blog.csdn.net/windone0109/article/details/5029560).

```bash
@echo off
for /f "delims=" %%i in ('dir /s/b *.md') do (
        for /f "delims=" %%a in ('type "%%~fi"') do (
                set "foo=%%a"
                call,set foo=%%foo:\\=\\\\%%
                call,set foo=%%foo:_=\_%%
                call,set foo=%%foo:\{=\\{%%
                call,set foo=%%foo:\}=\\}%%
                call,set foo=%%foo:\#=\\#%%
                call,echo/%%foo%%>>"%%~fi._"
)
move "%%~fi._" "%%~fi"
)
exit
```

注意如果中文使用的是UTF-8编码情况下会乱码, 需要用Emeditor转换为GB2312.



### 解决 MathJax 与 Markdown 的冲突的另外一个思路

一个妥协的办法，是用 JavaScript 处理所有的 `<code>` 标签：如果发现 `<code>` 标签内包含数学公式（以美元符号 $ 开头结尾），那么就剥离标签，并调用 MathJax 处理. 下面我们来实现这一思路, 参见[解决 MathJax 与 Markdown 的冲突](https://liam0205.me/2015/09/09/fix-conflict-between-mathjax-and-markdown/).

```js
<script type="text/javascript">
$(document).ready(function(){
 $("code").map(function(){
 match = /^\$(.*)\$$/.exec($(this).html());
 if (match){
 //$(this).after("<span class=mathjax_inline>" + match + "</span>");
 //$(this).hide();
 $(this).replaceWith("<span class=hpl_mathjax_inline>" + $(this).html() + "</span>");
 MathJax.Hub.Queue(["Typeset",MathJax.Hub,$(this).get(0)]);
 }
 });
});
</script>
```

这里，我们用正则表达式匹配了 `<code>` 标签内的美元符号，然后将 `<code>` 标签替换成 `<span class = hpl_mathjax_inline>` 标签，最后调用 `MathJax.Hub.Queue` 处理数学公式。经过这样一番处理，包在两个反引号之间的公式就可以被正确处理。



2018年7月9日更新





