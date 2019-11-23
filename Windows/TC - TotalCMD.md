# Total Commander 使用经验



## 一些我喜欢的快捷键
1. `Ctrl+H` 显示/隐藏隐藏文件
2. `Ctrl+3` 复制文件路径



## 设置 TC 为系统默认的资源管理器

1. 打开注册表：Win+R → regedit

2. 定位 `HKEY_CLASSES_ROOT\Directory\shell`，修改 shell 默认值为 TC
   在 shell 下新建一个子项 `TC`

3. 在 TC 下继续新建一个子项 `Command`，修改默认值为：

   ```bash
   "D:\Program Files\TotalCMD\Totalcmd64.exe" "/R=%1"
   ```


参考文章: [设置 TC 为系统默认的资源管理器](https://zhuanlan.zhihu.com/p/79046588).



