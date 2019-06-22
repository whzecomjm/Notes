# 简洁的静态博客构建工具 —— 纸小墨

[toc]

## 纸小墨简介

纸小墨（InkPaper）是一个使用GO语言编写的静态博客构建工具，可以快速搭建博客网站。优点是无依赖跨平台，配置简单构建快速，注重于简洁易用与排版优化。

### 开始上手
- 下载并解压 [Ink](http://www.inkpaper.io/)，运行命令 `ink preview` (linux 系统下使用`./ink preview`即可)
- 使用浏览器访问 `http://localhost:8000` 预览

### 配置网站
编辑`config.yml`，使用如下格式

``` yaml
site:
    title: 网站标题
    subtitle: 网站子标题
    limit: 每页可显示的文章数目
    theme: 网站主题目录
    disqus: Disqus评论插件账户名
    root: 网站根路径 #可选
    lang: 网站语言 #支持en, zh，可在theme/lang.yml配置
authors:
    作者ID:
        name: 作者名称
        intro: 作者简介
        avatar: 作者头像路径
build:
    port: 预览端口
    copy:
        - 构建时将会复制的目录/文件
    publish: |
        ink publish 命令将会执行的脚本
```

### 创建文章
在`source`目录中建立任意`.md`文件（可置于子文件夹），使用如下格式

``` yaml
title: 文章标题
date: 年-月-日 时:分:秒 #创建时间，可加时区如" +0800"
update: 年-月-日 时:分:秒 #更新时间，可选，可加时区如" +0800"
author: 作者ID
cover: 题图链接 #可选
draft: false #草稿，可选
top: false #置顶文章，可选
preview: 文章预览，也可在正文中使用<!--more-->分割 #可选
tags: #可选
    - 标签1
    - 标签2

---

Markdown格式的正文
```

### 发布博客
- 在博客目录下运行`ink publish`命令自动构建博客并发布
- 或运行`ink build`命令将生成的`public`目录下的内容手动部署

> Tips: 当使用`ink preview`命令时，`source`目录中文件发生变化，会自动重新构建博客，刷新浏览器以更新

## 定制支持

### 修改主题

默认主题使用coffee, less编写，修改对应文件后，需要在`theme`目录下运行`gulp`命令重新编译，使用`ink build`命令构建时默认将会复制js, css目录到`public`目录下。

页面包含`page.html`（文章列表）及`article.html`（文章）等，所有页面均支持[GO语言HTML模板](http://golang.org/pkg/html/template/)语法，可引用变量。

### 添加页面

在`source`目录下创建的任意`.html`文件将被复制，这些文件中可引用`config.yml`中site字段下的所有变量。

### 博客迁移(Beta)

Ink提供简单的Jeklly/Hexo博客文章格式转换，使用命令：
``` shell
ink convert /path/_posts
```

## 主题

- Pure: [https://github.com/Xdatk/ink-pure](https://github.com/Xdatk/ink-pure)
- Werttin: [https://github.com/Skimige/ink_Werttin](https://github.com/Skimige/ink_Werttin)

## 在线部署

使用 [Travis CI](http://www.shery.me/blog/travis-ci.html) 可以实施在线部署ink。
