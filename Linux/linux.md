# Linux 学习笔记

## 清理命令

```linux
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P         //清除残余的配置文件
```

## 安装软件

推荐安装以下软件：

- ibus-Pinyin、Ubuntu Tweak、nautilus-open-terminal、Dropbox、Leafpad、Inkscape
- [WizNote](http://blog.wiz.cn/wiznote-linux.html)、KeePassX、TeXmacs、Git Gui、Almanah

### 安装上述软件方法

```linux
sudo apt-get install ibus-pinyin // 安装ibus拼音
/usr/lib/ibus-pinyin/ibus-setup-pinyin  //  设置ibus-pinyin，
sudo apt-get install nautilus-open-terminal // 安装 NOT
sudo add-apt-repository ppa:tualatrix/ppa
sudo apt-get update
sudo apt-get install ubuntu-tweak // 安装ubuntu-tweak
```

### ibus拼音自动启动设置

想要ibus自动启动，我们需要找到language-support这个应用，然后找到keyboard input method system设置项（默认的是none），选择ibus项就可以了。



## 参考文献

- [Linux 基本指令介紹](http://linux.vbird.org/linux_basic/redhat6.1/linux_06command.php)

- [Ubuntu Skills](http://wiki.ubuntu.org.cn/UbuntuSkills)

- [Linux平台常用软件总结](http://www.jianshu.com/p/4adbfd83b29f)

- [Linux笔记by chenzhiwei](https://github.com/chenzhiwei/linux)

- [Linux查看系统信息的一些命令及查看已安装软件包的命令（转)](http://cheneyph.iteye.com/blog/824746)

- [linux下压缩某个文件夹](https://www.jianshu.com/p/8edabc1b5819)

