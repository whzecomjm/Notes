# Notepad 使用笔记
 
## Notepad++ 配置 Markdown 实时预览
 
 
NppMarkdown 插件实现了Markdown 的实时预览，但是缺乏可定制性，不能定义HTML的样式。本文介绍另外一个插件，[Preview HTML](http://fossil.2of4.net/npp_preview/home)，配合Pandoc，可以实现更好的HTML预览，例如可以引入自定义CSS和JS，显示高亮代码和Mathjax公式等。
 
### 环境要求
 
* 安装pandoc并且配置了Path
* 安装Notepad++插件 Preview HTML，注意应从官网下载最新版，Plugin Manager里的可能不是最新版
 
### 配置插件
直接在插件菜单中编辑配置文件，会在`%APPDATA%++`下创建相关配置文件。
 
* Edit Filter definitions，设置过滤器，调用pandoc转换为html，格式如下:
 
 
```
; Content of Filter.ini file
[Markdown]
Extension=.md
Command=pandoc --template=tpl.html5 --highlight-style=tango --mathjax="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" "%1"
```
 
* Edit Settings，设置自动刷新间隔，格式如下
 
```
[Autorefresh]
Interval=0
```
 
> 相关模板下载以及参考文献 http://www.annhe.net/article-3271.html
 
## Notepad++ 常用运行脚本
 
### Pandoc 包括模板
```
cmd /c pandoc -s "$(FULL_CURRENT_PATH)"  -o  "$(CURRENT_DIRECTORY)\$(NAME_PART).pdf" --template=template.tex
--latex-engine=xelatex --variable fontsize=12pt& "$(CURRENT_DIRECTORY)\$(NAME_PART).pdf"
```
 
### Pandoc 不包括模板
```
cmd /c pandoc -s "$(FULL_CURRENT_PATH)"  -o  "$(CURRENT_DIRECTORY)\$(NAME_PART).pdf" --latex-engine=xelatex
--variable fontsize=12pt& "$(CURRENT_DIRECTORY)\$(NAME_PART).pdf"
```
 
### Pdflatex 编译
```
cmd /c cd /d $(CURRENT_DIRECTORY) && pdflatex.exe -shell-escape "$(FILE_NAME)"
```
 
### html2md
```
cmd /c pandoc -s "$(FULL_CURRENT_PATH)"  -o  "$(CURRENT_DIRECTORY)\$(NAME_PART).md"
```
 
### Reveal.js 编译
```
cmd /c pandoc -s --mathjax -i -t revealjs "$(FULL_CURRENT_PATH)"  -o  "$(CURRENT_DIRECTORY)\$(NAME_PART).html"
```
建议运行此脚本时同目录下有下载好的revealjs文件夹，因为默认的api速度很慢。
 
一些tips：
 
- 可以加入 `--self-contained` 生成不依赖于同目录下 reveal.js 的html文件。
- 增加 `--slide-level=2` 可以生成二维的幻灯片，其中h1是左右切换，h2为上下切换。
- `-V theme=moon` 可以更改主题。
 
 
## Notepad++ 编辑yml文件tab失效的解决
 
在Notepad++ 编辑yml文件时，tab键建立的空格不能被识别，解决方案如下：
 
> 设置>首选项>制表符设置>转换为空格
 
当然可以选择对应语言设置。