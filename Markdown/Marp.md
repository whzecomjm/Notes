# Marp

Marp 是一个使用 Markdown 书写 Slides 的框架软件. 他的作者早期的产品是一个基于 Electron 的软件: [Marp](https://github.com/yhatt/marp). 不过这个软件现在已经停止更新, 最终的版本是 0.0.14. 在此之后, 作者投入了新的 Marp 生态系统. 它包括了 Marp Core, [Marpit](https://github.com/marp-team/marpit) 等内核和框架, 以及 [Marp CLI](https://github.com/marp-team/marp-cli) [^1], [Marp Web](https://github.com/marp-team/marp-web) 和未来将要做的 Marp Desktop 等应用.

> 想要最方便的体验使用 [Marp Web](https://web.marp.app/) 即可 !



[^1]: CLI 在程序开发中是指 `Command-line interface` 命令行交互.



## Marpit Markdown

下面我们讲解一下 Marp 的基本Markdown语法和配置, 更多帮助参见: ==[Marpit Markdown](https://marpit.marp.app/markdown)==.

在 Markdown 里表示水平线的 `---` 等是 Marp 的分割Slides的符号. 其他大多数常规的 Markdown 用法是相同的.

下面介绍 Marp 的特殊`指令`. 指令需要用 yaml 的格式书写, 这包括 html 注释或者 YAML front-matter.

```html
<!--
theme: default
paginate: true
-->
```

```yaml
---
theme: default
paginate: true
---
```

上述两串代码都是表示使用默认主题, 添加分页序号.

Marp 目前有两个自带主题, 白色的 `default` (可以不声明), 以及羊皮黄的 `gaia`.

### 全局指令

我们可以用前缀 `$` 表示==全局==的指令, 比如 `<!-- $theme: default -->`, 用前缀 `_` 表示强制本页的==局部==指令, 比如 `<!-- _backgroundColor: aqua -->`. 

所有的指令中, `theme`, `style`, `headingDivider` 是全局指令, 所以不用前缀都是表示全局. 其中 `headingDivider: n` 的数字表示使用n级标题自动当作分割slides的符号.

### 局部指令

局部指令比较多, 具体如下:

| Name                 | Description                                        |
| -------------------- | -------------------------------------------------- |
| `paginate`           | Show page number on the slide if you set `true`.   |
| `header`             | Specify the content of slide header.               |
| `footer`             | Specify the content of slide footer.               |
| `class`              | Specify HTML class of slide’s `<section>` element. |
| `backgroundColor`    | Setting `background-color` style of slide.         |
| `backgroundImage`    | Setting `background-image` style of slide.         |
| `backgroundPosition` | Setting `background-position` style of slide.      |
| `backgroundRepeat`   | Setting `background-repeat` style of slide.        |
| `backgroundSize`     | Setting `background-size` style of slide.          |
| `color`              | Setting `color` style of slide.                    |

`<!-- _class: lead -->` 可以设定内容居中.

对于slides的背景设置, 我们还可以简单的用 `![bg]()` 来设定, `![bg contain]()` 还能放缩的和页面一样大小. 更多关于 `bg` 的参数, 参见 [Image syntax](https://marpit.marp.app/image-syntax), 里面也包含更多插入图片的配置.

### 支离列表

在Markdown中可以使用 `-,+,*` 三种标记无序列表, 但在 Marp 里 `*` 表示支离无序列表 (相当于列表的动画). 类似的, `1)` 这种数字加括号的表示支离有序列表.

## 插图指令

上节最后我们讲了一下背景的设定可以用一些参数调节大小. 其实, 对于任意的我们想要插入的图片都是可以的.

```markdown
![width:200px](image.jpg) <!-- Setting width to 200px -->
![height:30cm](image.jpg) <!-- Setting height to 300px -->
![width:200px height:30cm](image.jpg) <!-- Setting both lengths -->
![w:32 h:32](image.jpg) <!-- Setting size to 32x32 px -->
```

除了上述大小的设置过滤器 filter, 对于图片我们还有更多的 filters:

| Markdown           | w/ arguments                                 |
| :----------------- | :------------------------------------------- |
| `![blur]()`        | `![blur:10px]()`                             |
| `![brightness]()`  | `![brightness:1.5]()`                        |
| `![contrast]()`    | `![contrast:200%]()`                         |
| `![drop-shadow]()` | `![drop-shadow:0,5px,10px,rgba(0,0,0,.4)]()` |
| `![grayscale]()`   | `![grayscale:1]()`                           |
| `![hue-rotate]()`  | `![hue-rotate:180deg]()`                     |
| `![invert]()`      | `![invert:100%]()`                           |
| `![opacity]()`     | `![opacity:.5]()`                            |
| `![saturate]()`    | `![saturate:2.0]()`                          |
| `![sepia]()`       | `![sepia:1.0]()`                             |

### 高级背景

关于更多高级背景, 包括分割背景, bg 的左右等等高级功能, 参阅 [Image syntax](https://marpit.marp.app/image-syntax?id=image-syntax).

注: [fakeimg.pl](https://fakeimg.pl) 是一个有趣的网站, 可以使用类似 css 的链接直接快速生产你想要的 `fake` 图片.

### SVG

如果将 `inlineSVG: true` 加入 `Constructor options`, 则可以在 Marp 中直接插入 svg. 不过这一功能不能在 Marp Web 中使用.