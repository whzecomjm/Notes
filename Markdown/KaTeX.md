# KaTeX

其实早在好几年前 [KaTeX](https://khan.github.io/KaTeX/) 刚出来的时候, 我就有关注这个 MathJax 的代替者. 不过当时好多公式符号都无法加载, 那时甚至矩阵都显示有问题. KaTeX 虽然加载公式速度很快, 但是怕我文章里有公式不能正常显示, 所以还是没有选择使用它. 不过就像很多开源软件一样, 时间能让它们变得越来越好. 诚如前段时间回归 Typecho 重新写博客一样, Markdown 和 MathJax 之间的小 Bug 得到完美解决; 如今 KaTeX 也能独当一面, 可以彻底代替 MathJax 了.

为了方便, 所以还是使用了官方自带的 CDN 的简单配置. 

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.10.0-beta/dist/katex.min.css" integrity="sha384-9tPv11A+glH/on/wEu99NVwDPwkMQESOocs/ZGXPoIiLE8MU/qkqUcZ3zzL+6DuH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/katex@0.10.0-beta/dist/katex.min.js" integrity="sha384-U8Vrjwb8fuHMt6ewaCy8uqeUXv4oitYACKdB0VziCerzt011iQ/0TqlSlv8MReCm" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/katex@0.10.0-beta/dist/contrib/auto-render.min.js" integrity="sha384-aGfk5kvhIq5x1x5YdvCp4upKZYnA8ckafviDpmWEKp4afOZEqOli7gqSnh8I6enH" crossorigin="anonymous"></script>
```

​其中前两个是 KaTeX的基本配置,第三个是自动加载的插件. 不过之后遇到的  KaTeX 的唯一问题是默认所有公式无论是行间公式还是行内公式都要写在左右各两个美元符号内. 这和其他 LateX, MathJax 的习惯不一致. 所以我还是去看了一下设置, 其实在配置`delimiters` 中修改. 于是我改为如下配置:

```js
<script>
    renderMathInElement(document.body,
   {
              delimiters: [
                  {left: "$$", right: "$$", display: true},
                  {left: "\\[", right: "\\]", display: true},
                  {left: "$", right: "$", display: true},
                  {left: "\\(", right: "\\)", display: false}
              ]
          }
  );
</script>
```

问题并没有因为我把单个美元符号的`display`改为`true`而愉快地被解决, 之后所有行内公式也会被加载为行间公式. 于是我再看到官方文档中有`displayMode`的选项. 不过作者说默认是关闭的, 因为这个选项`true`就是行间公式(公式会变大,且居中). 于是我很开心地加一句 `displayMode: false`, 不过没有任何变化. 

经过排列组合地各种尝试, 我惊奇地发现需要将单美元符号display改为 false, 然后打开 displayMode, 这样看起来完完全全相反的设置竟然"负负得正", 完美解决了这一问题. 撒花~ *★,°*:.☆(￣▽￣)/$:*.°★* 。更改后的设置如下:

```js
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.10.0-rc.1/katex.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.10.0-rc.1/katex.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.10.0-rc.1/contrib/auto-render.min.js"></script>
<script>
    renderMathInElement(document.body,
   {
              delimiters: [
                  {left: "$$", right: "$$", display: true},
                  {left: "$", right: "$", display: false}
              ]
          }
  );
</script>
```

实际上发现默认的`displayMode`值其实是 true. 最后终于开心地发现博客里的数学公式加载变快了, 同时 KaTeX 和 InstantClick 也没有像 MathJax 一样有时候出现加载到一半(mathjax快速预览)的冲突. 赞!

whzecomjm
2018年7月12日

-----

## 更新 KaTeX4Typecho 插件

今天逛Typecho论坛发现已经有人制作了 [KaTeX4Typecho](https://github.com/vc12345679/KaTeX4Typecho). 不过鉴于我知道 Typecho 1.1 正式版之后它的 Markdown内核 [HyperDown 的更新](/archives/start.html), 之前和其他无论是动态博客还是静态博客都一样存在的 `\` 转义的 bug 得到解决, 所以我们可以开心回归"正常的LaTeX写法".

于是我顺便下载该插件试用以后发现之前的设置不友好, 于是将默认设置更新为 `$ ... $` 表示行内公式, 而 `$$ ... $$`表示行间公式. 这样就和我们平时用的 LaTeX 书写方法一致. 同时顺便也更新了最新的KaTeX 0.10.0, 能支持更多的公式选项. 鉴于原作者不在维护该插件, 我于是fork一下更新了一下, 需要的同学可以从我的[Github仓库](https://github.com/whzecomjm/KaTeX4Typecho)下载安装. 

2018年7月15日

插件一个小Bug, 题目如果出现大括号会自动加载为行间公式. 检测结果是 `\[\]` 等价于 `[]`, 这应该是 Hyperdown不想做的, 只支持美元形式, 其实也更好.



## 国内开源项目 CDN 加速服务的KaTeX 

```html
<link rel="stylesheet" href="https://cdn.bootcss.com/KaTeX/0.10.0-alpha/katex.min.css">
<script src="https://cdn.bootcss.com/KaTeX/0.10.0-alpha/katex.min.js"></script>
<script src="https://cdn.bootcss.com/KaTeX/0.10.0-alpha/contrib/auto-render.min.js"></script>
```

