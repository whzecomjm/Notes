Latex 学习笔记
===

[toc]

## 常误用的符号

常用符号公式的输入可以参见: 维基百科帮助[帮助:数学公式](https://zh.wikipedia.org/wiki/Help:数学公式).

- 同余不要使用 `\mod` 而使用 `\pmod`, 比如 $a\equiv b \pmod m$.

- `\bar` 只是一个重音符号, 尽可能的用 `\overline`.

- 在集合表示里的 `|` 可以用 `\mid` 表示: $\mid$.

- `\leqslant` 和 `leq` 的区别: $\leqslant, \leq$.

- 在公式中输入文本可以用 `\text` 或者 `\mbox`.

- 在符号上下输入文字或者字符, 使用 `\underset` 和 `\overset`, 比如: $u \underset{\alpha}{+} v \overset{1}{\thicksim} w$.

- `\overbrace` 可以输入上括号: $\overbrace{a+b+\cdots+z}^n$.

- `\hdotsfor{5}` 可以在矩阵里输入一连串(5个entries)的 `hdots`.

  

## 宏包的使用

*  使用宏包 `CJKutf8` 支持中文；
*  加载宏包 `amscd` 可以输入交换图。[用法](http://www.jmilne.org/not/Mamscd.pdf)
*  用 `\tableofcontents` 生成目录，如果目录要带链接的话, 需要添加宏包`hyperref`。[详情](http://hi.baidu.com/thinks_thinkin/item/2e3cf7384b275bc8392ffaf5)
*  使用宏包`enumerate`，可以把列举的编号变成 `\begin{enumerate}[A.]`使得编号为 A. B. C.等，而不是1,2,3。
*  使用`\mathscr`花体字，需要要先加入宏包`mathrsfs`.



## 参考文献

- bib转换为可以插入latex的bbl (arXiv需要), 使用 `overleaf`, 编译以后查找 `logs and output files` 右下角可以下载bbl文件.




## 公式环境
* `boxed{ }`可以加一个边框。放在`equation`环境之内。
* `subequation` 可以使得编号不变两（多）个公式区分，实际加入了a。进一步我们可以记录。
* 在`\begin{document}`后面加入`\numberwithin{equation}{section}`可以让公式按照小节来编号。
* `\( \)`或者`\[ \]`环境是LaTeX的风格，而`$`与`$$`是TeX的风格，推荐使用前者。
* `align`可以代替几乎所有`eqnarray`和`aligned`的功能. `align`可以写多列对齐，代替公式环境里的`aligned`环境, 所以尽量使用`align`. 但是 `aligned` 可以在[行内公式使用](https://tex.stackexchange.com/questions/401201/difference-between-align-and-alignedt). 另外尽量不要使用 eqnarray, 它在设计上问题较多，主要是间距不对，基本上被认为不宜使用. align 和 aligned 由 amsmath 宏包提供，eqnarray 是 LaTeX2e 内核提供。





## 空格与空行

- `\, \> \;` 能给出空格，其中`\;`空格更大;
- `\phantom{}`插入一个括号内宽度的空格，相当于键入一个不可见、但是仍然占字符位置的符号;
- `\medskip` 给出一个段落空行
- 两个字符重叠可以使用`\!`(减少字距离), 比如 $\pi\!\;\!\!\!\pi$.



## 双括号及其它特殊符号

* 插图 `\begin{figure}[thispage]`,thispage是一个很好的参数，可以很好地控制图片位置。

* **双括号**: 双中括号 `$[\![ e=mc^2 ]\!]$` 和双小括号 `$(\!( a^2 )\!)$`：$[\![ e=mc^2 ]\!],(\!( a^2 )\!)$

*  双角括号 `\llangle` 定义如下：

   ```latex
   % llangle and rrangle
   \makeatletter
   \newsavebox{\@brx}
   \newcommand{\llangle}[1][]{\savebox{\@brx}{\(\m@th{#1\langle}\)}%
     \mathopen{\copy\@brx\kern-0.5\wd\@brx\usebox{\@brx}}}
   \newcommand{\rrangle}[1][]{\savebox{\@brx}{\(\m@th{#1\rangle}\)}%
     \mathclose{\copy\@brx\kern-0.5\wd\@brx\usebox{\@brx}}}
   \makeatother
   ```

*  `\imath,\jmath` 给出没有头部一点的 i,j，即 $\imath,\jmath$.

 

## 箭头汇总

[access2science 整理了一个十分全面的表](http://www.access2science.com/latex/Arrows.html)，几乎应有尽有，但是即便如此，我还是找到了一些未在列表中的常用箭头，现增补如下：

| Latex 代码 |    符号 |    描述|
|:-------------|:----:|:----------------|
|\gets|    ←    | 左箭头 |
|\to    | → |    右箭头 |
|\iff|⇔|    当且仅当|
|\mapsto    | ⤇|元素映射箭头|



## 其他参考

1. [LaTeX页码设置](https://blog.csdn.net/japinli/article/details/51418977)