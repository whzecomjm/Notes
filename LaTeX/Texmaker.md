# Texmaker配置


CTex和Texmaker的下载方法就不必细谈了，在官方网站上有。主要是CTex建议选择完全版。由于CTex自带的WinEdit是收费软件，不符合自由软件之精神，另外的Texworks又过于简陋，因此采取CTex+Texmaker的方案。CTex和Texmaker的安装都很傻瓜，注意，CTex在安装的时候不要勾选WinEdit。

CTex安装会自动配置好latex路径，无需用户自己设置。因此，关键在于Texmaker的设置中间程序dvi和ps等等。打开Texmaker，执行：`选项->配置Texmaker`，需要设置的有dvi查看器、ps查看器和ghostscript以及pdf查看器，其中的pdf一栏需要填写自己的pdf浏览器的位置。


注：中文文档可以使用xelatex编译，所以安装miktex也可以，因为xelatex自带ctexart宏包。）

参考资料：<http://blog.csdn.net/pdcxs007/article/details/9112823>

## 其他问题

1. **编辑器乱码**：如果遇到编辑器乱码，请到**设置->编辑器->编辑器字体**更改合适的字体即可。
2. 更新 Texmaker 5.0 以后win10显示会因为屏幕不够大导致无法保存设置，打开 texmaker.exe的兼容性管理，选择“替代高DPI缩放行为”，改为系统即可。设置完以后调整回来可以避免显示模糊。
3. 更新以后的 Texmaker 5.0 可以设置自动清理缓存文件，不再使用clean.bat。