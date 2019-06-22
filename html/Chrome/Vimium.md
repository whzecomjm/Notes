# Vimium 教程

所有快捷键可以通过`?`查看.

[TOC]



最常用的快捷键
-----------

    向下/上/左/右移动  j/k/h/l
    向下/上跳动  d/u
    回到顶/尾部  gg/G
    窗口打开模式 本窗口/新窗口 f/F
    查找历史记录+书签   o/O
    关闭/恢复标签 x/X
    查找书签  b/B（当前/新窗口打开）
    选择左/右标签 J/K
    搜索剪贴板关键字 在当前/新窗口  p/P
    跳转到当前url上一级/最高级 gu/gU
    创建/查看标签页  t/T
    将焦点聚集在第一个输入框  gi  (2gi就是第二个输入框)
    刷新 r
    新标签中打开多个链接   <a-f> 即：alt+f
    开/关静音  <a-m>即：alt+m
    固定标签栏 <a-p>即 alt+p
    上一个标签  ^


其他不常用快捷键
------------

    查找（不支持中文）  /
        向下/上查找结果  n/N  (回车后直接打开链接，不用再使用f/F定位)
    复制当前链接 yy
    新模式 i
    查看源码 gs
    查看所以快捷键 ?
    编辑当前地址栏 g+e/E   并在当前/新窗口中打开
    复制当前标签页  yt
    移动当前标签到左/右侧边  <</>>
    滚动到页面最左/右边（在有滚动条下才有效果） zH/zL
    插入模式  i（可以屏蔽掉vimium快捷键，使其不和网页默认快捷键冲突）
    将标签页移动到新窗口  W
    创建新标记（可创建多个   m 使用方法
          设置当前/全局滚动条位置   m+小/大写字母
          跳转到设置的滚动位置   ~+字母
    切换到复制模式 v
    删除/修改命令
        删除指定命令
            unmap j   删除命令j
            unmapAll  删除所有命令
        修改命令（后面的命令参数可以在选择里面打开 show available commands找到）
            map a LinkHints.activateMode  把a定义原来f的功能
            map f scrollPageDown   把f定义成原来d的功能
    本地文件中使用vimium
        打开chrome插件设置页面，勾选"允许访问文件网址"



> 节选自作者：小佐
> 链接：https://www.zhihu.com/question/23483616/answer/246787555



快捷键访问任意指定网站
--------------------

以快捷打开 B 站为例，实现按下**「zb」**进入 B 站。操作如下

Options → Custom Key Mapping 内输入 :

    命令： map <hotkey> createTab <yoursite>
    
    举例：map zb createTab https://t.bilibili.com/

快捷键打开指定网站的站内搜索
-------------------

以知乎站内搜索为例，实现快捷键**「zh」**进入知乎站内搜索框。操作如下

*   搜索引擎的配置方法：  
    打开你想映射的网站 → 找到该网站搜索框 → 搜索任意内容回车后 → 复制网址 → 进入 Options → Custom Search Engine 编辑框→ 修改网址以匹配以下命令

    ```
    命令：<keyword>: https://yoursite.com/XXXXX=%s <sitename> 
    
    举例：zh: https://www.zhihu.com/search?type=content&q=%s 知乎
    ```
    
    

*   热键映射的配置方法（在 Options → Custom Mapping Key 编辑框）：

    ```
    命令：map <hotkey> Vomnibar.activateInNewTab keyword=<keyword>
    
    举例：map zh Vomnibar.activateInNewTab keyword=zh
    ```

以上两条规则中< keyword> 是同一个值 zh 。

p.s. 如果某个键**已经被赋予了命令**（如“r”默认刷新网页），那么就无法设置**以它开头**的快捷键，如“rb”：当你按下“r”时，直接实现网页刷新，后续按键无效。

所以建议使用以下冷门按键作为快捷键前缀：<a->、<c->、y、z 。使用 Alt 和 Ctrl 尤其要留意热键是否已被占用。
> 作者：Daha
> 链接：https://www.zhihu.com/question/23483616/answer/454855584



## 选定和复制粘贴

### 直接使用视觉模式复制

*   按`v`进入visual mode，第一次进入 visual mode 时因为没有选中内容转入caret mode 光标模式。

    关于Caret mode光标模式：在 visual mode下， **按 `c`** (c for caret) 就转成Caret mode 同时取消之前选中.

*   按v 如果右下角显示visual mode就可以hjkl选择了, 选中待复制内容后，按 `y` (y for yank) 可以复制，按 `<Enter>`也可以复制

### 使用搜索+视觉模式

- 搜索方法搜索起始点：/搜索内容
- 按 Enter。
- 启用视觉模式：v，按行的视觉模式：Shift + V
- 使用 vim 导航键选择文本：h、j、k、l、b、e、w、$（我特别喜欢 Shift + w，因为这个组合键可以按单词选择）
- 使用 y 将选择的文本复制到剪贴板。
- 切换程序，使用 Ctrl+V，将文本粘贴到其他程序中。

  


> 作者：刀锋君
> 链接：https://www.zhihu.com/question/22508515/answer/446324791



## 一些快键的修改

我的自定义修改如下, 部分参考 [Chrome神器Vimium的使用和配置](https://blog.csdn.net/qq_17758883/article/details/79896566).

1. wsad表示上下左右
2. 半页滚动-h/l
3. 取消u的映射

