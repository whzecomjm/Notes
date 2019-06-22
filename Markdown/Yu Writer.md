# Yu Writer 指南

[Yu Writer](https://ivarptr.github.io/yu-writer.site/) 支持文件的版本控制并将会支持服务器同步(可能已经支持了)。尤其还能支持*全文搜索*，之后还将继续更新创建Wiki的图书库。Yu Writer 的Markdown完美支持MathJax更是一大亮点。

右边缩略预览**可以左拉变成左边编辑右边预览**的形式。这个编辑器有时候会有Read Mode模式不能正常打开，显示空白的bug。之前可能是没有写入程序注册表，导致Rollback不可用，现在已经修复，可以正常使用。

有一个Bug, 不能主动删除用户文件夹下的图片文件夹 (但可以尝试自定义更改路径)，否则无法打开 Yu Writer，弹出 javascripts 关于pictures 的错误。这是偶然发现的，通过[windows自带截图不能保存](https://jingyan.baidu.com/article/495ba841f2da2638b30ede2d.html)查到，完美解决。

**独立配置历史文件夹**: 0.4.4 版本实际上是[支持把 .resource 目录独立出来的](https://github.com/ivarptr/yu-writer.site/issues/182)，但需要手动修改配置文件，还没有图形化的设置界面。大概在 0.5.x 之后把这个设置项补上。在库文件夹里创建一个名为 `yulib.config` 的文件（此文件为库的配置文件），然后用纯文本编辑器打开，写入如下内容：

```yaml
{
    "isolateResource": true
}
```

往后所有历史记录将会集中保存在一个名字为 `yulib.resource` 的文件夹里, 该文件夹和源文档文件夹有同样的文件目录结构。每个库的配置文件是相互独立的，如果有多个库都需要把 .resource 分离出来，则每个库都要重复上述的操作。

由于 Yu Writer 声称的很多好功能一直跳票, 作者不更新Windows, 且过了一年发现 Typora 变得特别好用, 能支持目录和树状图, 所以转回使用 Typora. 全文搜索交给 *everything* 即可.

