Sed 学习笔记
===

## 内置Cat

首先Sed自带cat（而Git 也自带Sed,Cat等linux命令），先简单介绍一下cat的主要三大功能：

1. 一次显示整个文件。 `cat filename`
2. 从键盘创建一个新文件。 `cat > filename`
3. 将几个文件合并为一个文件： `cat file1 file2 > file`

## 替换功能

使用命令sed可以将其中`old`替换为`new`。s表示替换命令，/old/表示匹配old，/new/表示把匹配替换成new，/g 表示一行上的替换所有的匹配。如果需要替换的内容有单引号之类的特殊符号，可以通过加双引号来实现。

```shell
sed s/old/new/g text.txt
sed "s/old/new/g" text.txt
```
上面的sed并没有对文件的内容改变，只是把处理过后的内容输出，如果你要写回文件，你可以使用重定向，或使用 -i 参数直接修改文件内容:

```shell
sed "s/old/new/g" text.txt > newtext.txt   
sed -i "s/old/new/g" text.txt
```
## 其它命令

```shell
sed -i '/commit/d' logs.md //删除logs.md文件中所有含有“commit”字符的整行。
```

## 正则表达式

这里介绍一下正则表达式的一些最基本的东西：

- `^` 表示一行的开头。如：`/^#/` 以#开头的匹配。
- `$` 表示一行的结尾。如：`/}$/` 以}结尾的匹配
- `\<` 表示词首。 如 `\>` 表示词尾。 如 `abc\>` 表示以 abc 結尾的詞.
- `.` 表示任何单个字符。
- `*` 表示某个字符出现了0次或多次。
- `[ ]` 字符集合。 如：`[abc]`表示匹配a或b或c，还有`[a-zA-Z]`表示匹配所有的26个字符。如果其中有^表示反，如`[^a]`表示非a的字符

更多内容可以参考如下教程： 
1. [sed 简明教程](http://www.cnblogs.com/pmars/archive/2013/02/20/2918159.html)
2. [官方快速参考](http://sed.sourceforge.net/sed1line_zh-CN.html)