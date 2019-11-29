# CMD 教程

## 常用的CMD命令

- `cd, chdir`: 显示当前目录的名称或将其更改。 注意空格要用引号括起来.
- `CHKDSK`: 检查磁盘
- `CLS ` : 清除屏幕。
- `CMD`: 打开另一个 Windows 命令解释程序窗口。
- `COMP ` : 比较两个或两套文件的内容。
- `COPY`:  将至少一个文件复制到另一个位置。
- `DEl`: 删除至少一个文件
- **`DIR`**:  显示一个目录中的文件和子目录。相当于 linux 的 `ls`.
- **`FC`** : 比较两个文件或两个文件集并显示它们之间的不同。
- `FIND`: 在一个或多个文件中搜索一个文本字符串。
- `FINDSTR`: 在多个文件中搜索字符串。
- **`Help`**: 提供帮助信息, 可单独使用, 也可以后面接命令, 比如 `help fc`.
- `md, mkdir`: 创建一个目录
- `MOVE`: 将一个或多个文件从一个目录移动到另一个目录。      
- `RD, rmdir`:  删除目录。
- `ren, rename`: 重命名文件 
- `REPLACE` : 替换文件。
- `SHUTDOWN`: 允许通过本地或远程方式正确关闭计算机。
- `START` : 启动单独的窗口以运行指定的程序或命令。
- `TASKLIST`: 显示包括服务在内的所有当前运行的任务。
- `TASKKILL`: 中止或停止正在运行的进程或应用程序。
- `TREE`: 以图形方式显示驱动程序或路径的目录结构。
- **`TYPE`**: 显示文本文件的内容。

参考文献: [Windows 命令行基础](https://blog.henix.info/blog/windows-cmdbasic/).



## 替换 Markdown 的转义符号

在静态博客中, 我们的一些 MathJax 的符号需要转化为转义符号, 比如 `_` 要写成 `\_` 等等. 以下为[批处理代码](https://blog.csdn.net/windone0109/article/details/5029560)，保存为bat文件，双击执行，使用前备份文件。 它实现文件夹内的 Markdown 文件转化.

```shell
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



## Windows 10 家庭版打开组策略

下列 bat 代码能打开windows 10 家庭版的组策略, 使用管理员权限运行, 之后重启电脑即可.

```shell
@echo off
pushd "%~dp0"
dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >List.txt
dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>List.txt
for /f %%i in ('findstr /i . List.txt 2^>nul') do dism /online /norestart /add-package:"C:\Windows\servicing\Packages\%%i"
pause
```

参见: [Win10家庭版打开组策略方法](https://jingyan.baidu.com/article/647f0115eafbb67f2148a814.html).



## 清理 LaTeX 运行中间文件

每次本地使用完 LaTeX 都会产生很多中间文件, 我们可以使用如下的批处理文件清理: 

```powershell
del *.aux /s
del *.log /s
del *.lof /s
del *.lot /s
del *.bbl /s
del *.blg /s
del *.thm /s
del *.toc /s
del *.out /s
del *.loa /s
del *.dvi /s
del *.synctex.gz /s
```

 

