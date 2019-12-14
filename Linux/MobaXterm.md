# MobaXterm

安装 MobaXterm, 使用 ssh 连接 BIU-math. 

```
planet.cs.biu.ac.il:22
```

specify username + use private key. 

之后输入相应程序命令则可以生成图形界面.

```shell
cd /usr/local
cd /usr/local/bin
```



### BIU-math 拥有的程序

| 程序代码 | 程序介绍                 |
| -------- | ------------------------ |
| acroread | Adobe Acrobat            |
| display  | 图形化显示打开远程文件   |
| emacs    | Emacs                    |
| firefox  | Firefox                  |
| gap      | GAP (命令行界面)         |
| magma    | magma (命令行界面)       |
| matlab   | Matlab 2012b             |
| sage     | sage (命令行界面)        |
| soffice  | Open Office              |
| smath    | Open Office Math Formula |
| xmaple   | Maple 14                 |



参见: [BIU-Remote Graphical Applications](http://ezra.cs.biu.ac.il/?p=241&page=2).



### 进阶使用 VNC 远程可视化

使用putty打开登录BIU-Math, 输入 `vncserver`, 键入密码(两次, 我选择了自带密码). 之后弹出如下内容:

```shell
New VNC server is "planet:13697"

To tunnel VNC "planet:13697" through SSH:
Click on the upper left corner of PuTTY
Select "Change Settings..."
Under "Category" select:
"Connection"->"SSH"->"Tunnels"
Under "Add new forwarded port"
Source port: 5900
Destination: planet:19597
Click "Add"
Click "Apply"
(Leave PuTTY running)

To run a VNC Viewer:
Server: localhost

To stop VNC "planet:13697":
vncserver -kill :13697

```

我们需要添加一个转发端口 5900 , 类似于用putty代理. 

打开 MobaXTerm 新建一个 VNC 进程, 只要填写 localhost 即可 (端口默认是5900与putty设置一致).



## MobaXTerm 的 SSHTunnel

在 Moba 的 Tools 里也有 SSHTunnel 用以转发端口. 这一功能可以代替 putty 的端口转发的功能.



whzecomjm
2019-12-11

