# Hugo

[toc]

[Hugo](https://gohugo.io/)是一个用Go语言编写的静态网站生成器，它使用起来非常简单，相对于Jekyll复杂的安装设置来说，Hugo仅需要一个二进制文件hugo(hugo.exe)即可轻松用于本地调试和生成静态页面。Hugo生成静态页面的效率很高,比同类的静态网站生成器Jekyll甚至Hexo都要快不少。

- Hugo只有一个二进制文件（比如Windows里只是一个hugo.exe）
- Hugo可以将你写好的MarkDown格式的文章自动转换为静态的网页。
- Hugo内置web服务器，可以方便的用于本地调试。

## 开始使用
下载Hugo.exe以后就可以使用了，不需要其他的任何环境。不过为了能方便使用，首先将hugo的地址添加到系统环境变量Path中。之后可以新建hugo博客目录了。

    hugo new site path/to/site

Hugo默认生成的网站是没有任何皮肤模板的，需要先下载主题皮肤。可以下载所有皮肤，也可以只下载单个皮肤，下载后将他们放在 themes 文件夹内。为了方便起见，可以在 config.toml 添加一条主题信息。新建博客页面或者日志，之后输入`hugo`就能生成静态文件了，如果需要预览，hugo也提供本地服务器预览：

    git clone --recursive "https://github.com/spf13/hugoThemes" themes #下载主题
    hugo new about.md #创建一个页面
    hugo new post/first.md  #创建一个博客日志
    hugo server --theme="theme name" --buildDrafts --watch # –watch或者-w 监控到文章的改动自动刷新浏览器，--buildDrafts 是为了将草稿也纳入预览的范围中。

需要注意一个问题，预览也会生成静态文件，并且里面的baseurl为`http://localhost:1313/`，所以在部署之前，一定要记得使用指令`hugo`。

## 网站配置文件

config.toml是网站的配置文件，这是一个TOML文件，如果你不喜欢这种格式，你可以将config.toml替换为YAML格式的config.yaml，或者json格式的config.json。hugo都支持。以下是我的维基站用的 config.toml 文件：

```
baseurl = "http://wiki.whzecomjm.com"
languageCode = "en-us"
title = "Whziki"
disablerss = true
theme = "doc"
DisablePathToLower = true
publishdir = "public/public"

[params]
  description = "这里是whzecomjm的Wiki站—— Whziki。"
  author = "whzecomjm"
```

## 文档结构

执行`hugo new`完后，会在content/post目录自动生成一个MarkDown格式的first.md文件：

    +++
    date = "2015-01-08T08:36:54-07:00"
    draft = true
    title = "first"
    +++

`+++`可以替换为Jekyll/Hexo一样的`---`，里面的内容是这篇文章的一些信息。

## 官方资料

- 官方文档：https://gohugo.io/overview/introduction/
- 皮肤列表：https://github.com/spf13/hugoThemes

常用文档：

* [Configuring Hugo](https://gohugo.io/overview/configuration/)
* [Front Matter](https://gohugo.io/content/front-matter/)
* [Menus](https://gohugo.io/extras/menus/)
* [Template Variables](https://gohugo.io/templates/variables/)
* [Hosting on GitHub Pages](https://gohugo.io/tutorials/github-pages-blog/)

## 常见问题

1. 默认URL全部被转成了小写，使用`DisablePathToLower = true`可以保留区分大小写url。
2. 从hexo迁移到hugo，markdown文件只需要在第一行加上`---`即可。

参考：[使用hugo搭建个人博客站点](http://blog.coderzh.com/2015/08/29/hugo/)