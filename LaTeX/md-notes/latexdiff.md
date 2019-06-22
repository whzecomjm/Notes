# latexdiff的使用

简而言之，Latex编辑的文档，可以用latexdiff功能来标注修改稿和原稿的区别。

1. 首先，当然要安装Ctex 或者是 Miktex
2. 确认是否安装了Latexdiff，​运行命令行cmd，输入Latexdiff。（需要管理员权限的cmd）
3. 如果没有出现上图所示的提示，就要重新安装Latexdiff咯，安装Perl咯，还要添加Perl的环境变量的路径。
    1. 安装Latexdiff方法：​`开始菜单->Ctex->​MiKTeX->Maintenance(Admin)->Package Manager (Admin)`搜索安装即可
    2. 安装Perl，[官方下载地址](http://www.perl.org/get.html)。下载windows下的相应安装包后进行通常的安装即可。
    3. 设置环境变量：安装好后要将路径添加到系统的环境变量中，方便在任何路径下使用latexdiff，而不限于仅在它们的安装路径下使用。添加`C:\Perl64\bin`。
4. 找到`latexdiff`的miktex文件夹，
这里有很多与latexdiff有关的文件，却没有后缀。发现其中没有perl路径，因此自己在这里新建文件夹perl，并把图中方框里的有关文件copy到perl文件夹里，且添加后缀“.pl“。
5. 现在再在cmd中输入命令latexdiff应该就有回应啦。输入命令：
    ```latex
    latexdiff origin.tex modify.tex >diff.tex
    ```
6. 编译diff文件即可。