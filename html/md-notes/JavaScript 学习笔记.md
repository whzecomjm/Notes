# JavaScript 学习笔记

[TOC]



第一个html+js代码:

```html
<!DOCTYPE html>
<html>
<body>

<h1>我的第一段 JavaScript</h1>

<p id="demo">
JavaScript 能改变 HTML 元素的内容。
</p>

<script>
function myFunction()
{
x=document.getElementById("demo");  // 找到元素
x.innerHTML="Hello JavaScript!";    // 改变内容
}
</script>

<button type="button" onclick="myFunction()">点击这里</button>

</body>
</html>
```

## JS 的使用

HTML 中的脚本必须位于 <script> 与 </script> 标签之间。脚本可被放置在 HTML 页面的 <body> 和 <head> 部分中。

浏览器会解释并执行位于 <script> 和 </script> 之间的 JavaScript。那些老旧的实例可能会在 <script> 标签中使用 type="text/javascript"。现在已经不必这样做了。JavaScript 是所有现代浏览器以及 HTML5 中的默认脚本语言。

### 外部的 JavaScript

也可以把脚本保存到外部文件中。外部文件通常包含被多个网页使用的代码。外部 JavaScript 文件的文件扩展名是 .js。如需使用外部文件，请在 <script> 标签的 "src" 属性中设置该 .js 文件.

## JS 的输出

JavaScript 通常用于操作 HTML 元素。如需从 JavaScript 访问某个 HTML 元素，您可以使用 `document.getElementById(id)` 方法。请使用 "id" 属性来标识 HTML 元素. 

```js
document.getElementById("demo").innerHTML="我的第一段 JavaScript";
```

在这种情况下，浏览器将访问 id="demo" 的 HTML 元素，并把它的内容（innerHTML）替换为 "我的第一段 JavaScript"。

请使用 document.write() 仅仅向文档输出写内容。如果在文档已完成加载后执行 document.write，整个 HTML 页面将被覆盖：

```html
<button onclick="myFunction()">点击这里</button>

<script>
function myFunction()
{
document.write("糟糕！文档消失了。");
}
</script>
```

## JS 语句

分号用于分隔 JavaScript 语句。通常我们在每条可执行的语句结尾添加分号。使用分号的另一用处是在一行中编写多条语句。下面例子详细演示了 innerHTML 的书写或者更换文本的作用.

```html
<!DOCTYPE html>
<html>
<body>

<h1>My Web Page</h1>

<p id="demo">A Paragraph.</p>

<div id="myDIV">A DIV.</div>

<script>
document.getElementById("demo").innerHTML="Hello World";
document.getElementById("myDIV").innerHTML="How are you?";
</script>

</body>
</html>
```

### JavaScript 代码块

JavaScript 语句通过代码块的形式进行组合。块由左花括号开始，由右花括号结束。块的作用是使语句序列一起执行。

JavaScript 函数是将语句组合在块中的典型例子。下面的例子将运行可操作两个 HTML 元素的函数(是上节代码的函数化结果):

```html
<!DOCTYPE html>
<html>
<body>

<h1>My Web Page</h1>

<p id="myPar">I am a paragraph.</p>
<div id="myDiv">I am a div.</div>

<p>
<button type="button" onclick="myFunction()">点击这里</button>
</p>

<script>
function myFunction()
{
document.getElementById("myPar").innerHTML="Hello World";
document.getElementById("myDiv").innerHTML="How are you?";
}
</script>

<p>当您点击上面的按钮时，两个元素会改变。</p>

</body>
</html>

```

