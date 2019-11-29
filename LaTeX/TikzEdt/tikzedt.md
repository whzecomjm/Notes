# TikzEdt

[Tikz](http://www.texample.net/tikz/) 是基于 PGF 一个矢量图片生成的 LaTeX 宏包，可以用于画包括函数图、几何图形、交换图、树形图和文档框架设计等等。所以，可以在 tex 文件中直接插入所需要的图片。不过，对于初学者，可能并不好直接使用这样一个每次都需要编译 tex文件的宏包。另一方面，对于我写博客来说的话，如果能直接生成图片（透明底布）会显得更加方便。一个令人兴奋的消息是我找到了一个十分优秀的软件来使用 Tikz —— [TikzEdt](http://www.tikzedt.org/)。

TikzEdt 是一款“所见即所得”的 Tikz 前端编辑器。除了能直接调用 LaTeX 中的 Tikz 宏包（所以要安装 MikTex 等 LaTeX 发行包）以外，还能同时看到输出结果。并且， TikzEdt 能直接导出 jpg, png 等格式的图片，png 格式图片还是透明底布的。除此之外， TikEdt 也支持一定量的“纯鼠标操作”构图。


之前为了图方便，我博客中的插图要么就是用 Windows 画图软件“粗制滥造”，要么就是用 Mathematica、几何画板之类的画图功能，最近也用了 [TpX](http://tpx.sourceforge.net/) 这款优秀的软件代替。但是 TpX 最大的缺点是，图形中的文字不能使用 LaTeX 数学公式模式，且不能做我以后最需要的交换图。所以，当我看到 TikzEdt 这款软件以后，就迅速的爱上它了。

有了这个好用软件，我也开始整理一下 Tikz 宏包的使用。现奉上简单的一个上手教程，获取详细的教程[点此链接](http://www.texample.net/media/pgf/builds/pgfmanualCVS2012-11-04.pdf)。

正如和其他 LaTeX 环境的使用一样，我们需要用环境声明 `\begin{tikzpicture}` 与 `\end{tikzpicture}` 来包围代码。如果是在 LaTeX 中直接使用 Tikz，需要在引言中加入 `\usepackage{tikz}`，并且要将其包围在 figure 环境中。（当然也可以不包裹在 picture 环境中，此时的图片将会是行内图片。）TikzEdt 打开以后，就会自动显示 Tikzpicture 环境，所以只需要在其中输入代码就可以看到编译后效果，所以为了方便，下面假设我们在 TikzEdt 中使用 tikz。

## 直线绘制
首先是最简单的直线以及相关内容的绘制：使用 `\draw (0,0) -- (1,2);` 就可以画一条从（系统默认）坐标 (0,0) 到 (1,2) 的普通直线。进一步地，折线的画法也很简单，在后面点之后再添加 `-- (3,1)` 等即可。我们还可以，加入代码 `\draw[help lines] (0,0) grid (3,3);` 来做一个坐标辅助格子。

```latex
\begin{tikzpicture}
\draw[help lines] (0,0) grid (3,3);
\draw (0,0) --(1,2) -- (3,1) -- (2,0);
\draw (3,0) -- (1.5,0.5);
\end{tikzpicture}
```

我们发现图并没有我们想象中的大，我们可以使用 `[scale=3]` 等来放大图片，类似地可以拉伸或者拉宽图片 `[xscale=2.5,yscale=0.5]`。此代码用于 `\begin{tikzpicture}` 之后。有时候，图中有文字，这样的办法并不会加大文字，我们可以在文字中套用 LaTeX 中的 `\Large` 等命令。同样直线和曲线还可以通过修改 `line width` 或者加入 `thick` 等来加粗，比如 `\draw[line width=2pt]`，但是一个更好的做法是全局设置：

```latex
\tikzstyle{every node}=[font=\large]
\tikzstyle{every path}=[line width=2pt]
```

普通的直线可以通过加入一些“特征”来得到箭头等图。比如下面的例子：

```latex
\begin{tikzpicture}[scale=2]
\tikzstyle{every node}=[font=\large]
\draw[help lines] (0,0) grid (3,3);
\draw[line width=2pt][->] (0,0) --(1,2) -- (3,1);
\draw[thick] [<-] (0, 0.5) -- (2,2.5);
\draw[ultra thick] [|->] (0,0) -- (2,1);
\draw [<->] (0,4) -- (0,0) -- (4,0);
\end{tikzpicture}
```

![](tut_line2.png)


此外可以通过加入“属性” `dashed` 和 `dotted` 得到虚线和“点线”，加入颜色名比如 `[red]` 得到变色后的图形。

## 曲线绘制
曲线的一种做法是使用初始点和结束点的位置以及切线方向来自动生成的。一些简单的图可以直接生成，比如圆、椭圆。下面看一个例子就很清楚了：

```latex
\begin{tikzpicture}[scale=3]
\draw [<->, rounded corners, thick, purple] (0,2) -- (0,0) -- (3,0);
\draw [blue] (0.5,0.2) rectangle (1.5,1);
\draw [cyan] (0.5,2.3) ellipse (1 and 0.5);
\draw [red, ultra thick] (2.3,0.5) circle [radius=0.5];;
\draw [gray] (2,1.4) arc [radius=1.2, start angle=45, end angle= 120];
\draw[very thick] (0,0) to [out=90,in=195] (2,1.5);
\end{tikzpicture}
```

![](tut_curve.png)


同样 Tikz 也支持数学画图函数，用法如下：

```latex
\begin{tikzpicture}[xscale=13,yscale=3.8]
\draw [<->] (0,0.8) -- (0,0) -- (0.5,0);
\draw[green, ultra thick, domain=0:0.5] plot (\x, {0.025+\x+\x*\x});
\end{tikzpicture}
```

Tikz 支持 e, pi 等常数，支持函数如下：

```latex
factorial(\x), sqrt(\x,y), pow(\x), exp(\x), ln(\x), log10(\x),
log2(\x), abs(\x), floor(\x), sin(\x) （弧度表示为 `sin(\x r)`）,
cos(\x), tan(\x), min(\x,y), max(\x,y) 等等
```

 



## 交换图

交换图的绘制相对比较复杂，可以参见教程： [Commutative Diagrams using TikZ](http://www.felixl.de/commu.pdf)。下面仅给出一个例子：

```latex
\usetikzlibrary{matrix,arrows}
\begin{Huge}
\begin{tikzpicture}[description/.style={fill=white,inner sep=2pt}]
\matrix (m) [matrix of math nodes, row sep=3.5em,
column sep=2.9em, text height=1.6ex, text depth=0.25ex]
{ A & E& B \\
D& C &K \\ };
\path[->]
(m-1-1) edge node[auto] {$ \varphi $} (m-1-2)
edge node[description] {$ f $} (m-2-1)
edge node[description] {$d $} (m-2-2)
(m-1-2) edge node[auto] {$ \phi $} (m-1-3)
edge node[description] {$ h $} (m-2-2)
(m-2-2) edge node[auto] {$ \Phi $} (m-2-3)
(m-1-3) edge node[auto] {$ g $} (m-2-3)
(m-2-1) edge node[auto]{$\Psi$} (m-2-2);
\end{tikzpicture}
\end{Huge}
```

![](tut_commute.png)

 

## 其他内容

- 填充颜色： `[fill=orange]`
- 插入文字： `\node at (1,1) {yes};`，文字的位置可以用“方位词”来控制， `\node [below,above,left,right,above right]`

## 其它链接

- [TikzEdt 的下载地址](https://code.google.com/p/tikzedt/downloads/list)
- [简单的教程1](http://cremeronline.com/LaTeX/minimaltikz.pdf)
- [简单的教程2](http://www.jmilne.org/not/Mtikz.pdf)
- [PGF/TikZ资源汇总](http://hahack.com/tools/pgftikz-resources/)

