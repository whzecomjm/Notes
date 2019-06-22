# VirtualBox 笔记

## 共享文件夹

修改VitrualBox设置，增加“设备-共享文件夹”，之后在挂载点目录添加固定分配“Git”目录。具体参见[mount命令（用来挂载硬盘或镜像等）](http://www.cnblogs.com/itech/archive/2009/08/07/1541061.html).

```linux
sudo mkdir /mnt/Git  // 新建目录
sudo mount -t vboxsf -o iocharset=utf8 Git /mnt/Git 
//挂载共享文件夹，`iocharset=utf8`是为了显示中文文件
umount -f /mnt/Git  //卸载挂载点命令
```

设置自动挂载，使得重启虚拟机系统共享仍在。可以在`/etc/fstab`中添加一项(需要sudo权限用nano打开)

```linux
Git /mnt/Git vboxsf defaults,iocharset=utf8, rw 0 0
```

## 虚拟硬盘文件管理

[减小virtualbox虚拟硬盘vdi文件的大小](http://www.sijitao.net/1777.html).

```linux
sudo dd if=/dev/zero of=/free bs=1M
sudo rm -f /free                //碎片整理
VBoxManage modifyhd E:\ubuntu\ubuntu.vdi --compact   //关闭虚拟机,压缩磁盘
VboxManage modifyhd E:\ubuntu\ubuntu.vdi --resize SIZE_IN_MB //调整vdi大小
```

## 解决“网络已禁用”的问题
虚拟机中使用网络地址转换（NAT），电脑直接断电关机经常会引起此问题：

```linux
sudo service network-manager stop
sudo rm /var/lib/NetworkManager/NetworkManager.state
sudo service network-manager start
```

## 鼠标左键失灵

虚拟机内鼠标左键失灵可以关闭触摸板（我的触摸板左键坏了），重启linux即可。
