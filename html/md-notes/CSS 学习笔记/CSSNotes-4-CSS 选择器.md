# CSS 选择器

[TOC]



## 选择器的分组

你可以对选择器进行分组，这样，被分组的选择器就可以分享相同的声明。用逗号将需要分组的选择器分开。在下面的例子中，我们对所有的标题元素进行了分组。

```css
h1,h2,h3,h4,h5,h6 {
  color: green;
  }
```



继承及其问题

根据 CSS，子元素从父元素继承属性。如果你不希望被所有的子元素继承，创建一个针对子元素的规则即可.



## CSS 派生选择器

**通过依据元素在其位置的上下文关系来定义样式，你可以使标记更加简洁。** 派生选择器允许你根据文档的上下文关系来确定某个标签的样式。通过合理地使用派生选择器，我们可以使 HTML 代码变得更加整洁。比方说，你希望列表中的 strong 元素变为斜体字，而不是通常的粗体字，可以这样定义一个派生选择器：

```css
li strong {
    font-style: italic;
    font-weight: normal;
  }
```



## CSS id 选择器

id 选择器可以为标有特定 id 的 HTML 元素指定特定的样式。id 选择器以 `#` 来定义。注意, 和class属性不同的是, id 属性只能在每个 HTML 文档中出现一次。在现代布局中，id 选择器常常用于建立派生选择器。



CSS 类选择器

在 CSS 中，类选择器以一个==点号==显示：

```css
.center {text-align: center}
```

在上面的例子中，所有拥有 center 类的 HTML 元素均为居中。

注意, 类名的第一个字符不能使用数字！它无法在 Mozilla 或 Firefox 中起作用。

## CSS 属性选择器

对带有指定属性的 HTML 元素设置样式。可以为拥有指定属性的 HTML 元素设置样式，而不仅限于 class 和 id 属性。属性选择器在为不带有 class 或 id 的表单设置样式时特别有用, 比如表单:

```css
input[type="text"]
{
  width:150px;
  display:block;
  margin-bottom:10px;
  background-color:yellow;
  font-family: Verdana, Arial;
}

input[type="button"]
{
  width:120px;
  margin-left:35px;
  display:block;
  font-family: Verdana, Arial;
}
```

也可以与上面类似，可以只对有 href 属性的锚（a 元素）应用样式：

```css
a[href] {color:red;}
```

如果需要根据属性值中的词列表的某个词进行选择，则需要使用波浪号（~）。如果忽略了波浪号，则说明需要完成完全值匹配。	

### CSS 选择器参考

| 选择器              | 描述                                                         |
| ------------------- | ------------------------------------------------------------ |
| [attribute]         | 用于选取带有指定属性的元素。                                 |
| [attribute=value]   | 用于选取带有指定属性和值的元素。                             |
| [attribute~=value]  | 用于选取属性值中包含指定词汇的元素。                         |
| [attribute\|=value] | 用于选取带有以指定值开头的属性值的元素，该值必须是整个单词。 |
| [attribute^=value]  | 匹配属性值以指定值开头的每个元素。                           |
| [attribute$=value]  | 匹配属性值以指定值结尾的每个元素。                           |
| [attribute*=value]  | 匹配属性值中包含指定值的每个元素。                           |

## CSS 后代选择器和子元素选择器

后代选择器（descendant selector）又称为包含选择器。后代选择器可以选择作为某元素后代的元素。

与后代选择器相比，子元素选择器（Child selectors）只能选择作为某元素子元素的元素。(没有中间元素过渡). 如果您希望选择只作为 h1 元素子元素的 strong 元素，可以这样写：(子结合符两边可以有空白符也可以没有，这是可选的。)

```css
h1 > strong {color:red;}
```

这个规则会把第一个 h1 下面的两个 strong 元素变为红色，但是第二个 h1 中的 strong 不受影响：

```html
<h1>This is <strong>very</strong> <strong>very</strong> important.</h1>
<h1>This is <em>really <strong>very</strong></em> important.</h1>
```

## 结合后代选择器和子选择器

请看下面这个选择器：

```css
table.company td > p
```

上面的选择器会选择作为 td 元素子元素的所有 p 元素，这个 td 元素本身从 table 元素继承，该 table 元素有一个包含 company 的 class 属性。

## CSS 相邻兄弟选择器

相邻兄弟选择器（Adjacent sibling selector）可选择紧接在另一元素后的元素，且二者有相同父元素。

例如，如果要增加紧接在 h1 元素后出现的段落的上边距，可以这样写：

```css
h1 + p {margin-top:50px;}
```

这个选择器读作：“选择紧接在 h1 元素后出现的段落，h1 和 p 元素拥有共同的父元素”。

## CSS 伪类

CSS 伪类用于向某些选择器添加特殊的效果。伪类的语法：

```css
selector:pseudo-class {property: value}
```

### 锚伪类

在支持 CSS 的浏览器中，链接的不同状态都可以不同的方式显示，这些状态包括：活动状态，已被访问状态，未被访问状态，和鼠标悬停状态。

```css
a:link {color: #FF0000}		/* 未访问的链接 */
a:visited {color: #00FF00}	/* 已访问的链接 */
a:hover {color: #FF00FF}	/* 鼠标移动到链接上 */
a:active {color: #0000FF}	/* 选定的链接 */
```

| 属性                                                         | 描述                                     | CSS  |
| ------------------------------------------------------------ | ---------------------------------------- | ---- |
| [:active](http://www.w3school.com.cn/cssref/pr_pseudo_active.asp) | 向被激活的元素添加样式。                 | 1    |
| [:focus](http://www.w3school.com.cn/cssref/pr_pseudo_focus.asp) | 向拥有键盘输入焦点的元素添加样式。       | 2    |
| [:hover](http://www.w3school.com.cn/cssref/pr_pseudo_hover.asp) | 当鼠标悬浮在元素上方时，向元素添加样式。 | 1    |
| [:link](http://www.w3school.com.cn/cssref/pr_pseudo_link.asp) | 向未被访问的链接添加样式。               | 1    |
| [:visited](http://www.w3school.com.cn/cssref/pr_pseudo_visited.asp) | 向已被访问的链接添加样式。               | 1    |
| [:first-child](http://www.w3school.com.cn/cssref/pr_pseudo_first-child.asp) | 向元素的第一个子元素添加样式。           | 2    |
| [:lang](http://www.w3school.com.cn/cssref/pr_pseudo_lang.asp) | 向带有指定 lang 属性的元素添加样式。     | 2    |

## CSS 伪元素

伪元素的语法：

```css
selector:pseudo-element {property:value;}
```

| 属性                                                         | 描述                             | CSS  |
| ------------------------------------------------------------ | -------------------------------- | ---- |
| [:first-letter](http://www.w3school.com.cn/cssref/pr_pseudo_first-letter.asp) | 向文本的第一个字母添加特殊样式。 | 1    |
| [:first-line](http://www.w3school.com.cn/cssref/pr_pseudo_first-line.asp) | 向文本的首行添加特殊样式。       | 1    |
| [:before](http://www.w3school.com.cn/cssref/pr_pseudo_before.asp) | 在元素之前添加内容。             | 2    |
| [:after](http://www.w3school.com.cn/cssref/pr_pseudo_after.asp) | 在元素之后添加内容。             | 2    |

## div 和 span

2个都是用来划分区间但是没有实际语义的标签,差别就在于div是块级元素,不会其他元素在同一行;span是内联元素. 可以与其他元素位于同一行~