# 科学上网

科学上网太重要！特别是在国内用不了谷歌太难受。一个比较绿色的方法就是使用hosts。不过这个方法要经常更新，不一定保证一直有效。另外可以尝试一下无界科学上网和 SSR，虽然比较麻烦。同样在海外又想要看国内视频听国内歌。

[TOC]


## 酸酸乳——SSR

SSR可以使用ssr链接快速配置，一些很好的SSR免费账号分享网站：[FreeSS](https://ssx.re/), [poro](http://poro.dog/) , [ssrtool](https://www.ssrtool.com/tool/free_ssr)。

SSR免费节点推荐: [免费ss/ssr/vpn/brook账号密码分享free ssr ss vpn brook](https://darrenliuwei.com/%E5%85%8D%E8%B4%B9ss-ssr%E5%88%86%E4%BA%AB.html), 或者[免费ss/ssr分享](https://sphard2.github.io/gfw/free/ssr.html).

这之后我也是用谷歌免费一年的vps: [Google Cloud Platform 搭建了一个SSR服务器](https://suiyuanjian.com/124.html). 不过不好使用, 然后遇到文卫哥, 他把他日本vps搭建的SS给我使用. 之后文卫哥的SS也失效了, 我自己也成功搭了一个GCP-SSR, 现已过期.

**iOS SSR APP**:  Potatso Lite,  红叶加速器(提供免费SSR账号)



### 订阅地址

很多免费SSR会一段时间后更改密码, 有的提供[SSR地址订阅](https://dax309.club/SSRdy.html), 更加方便.

[SSRShare](https://ssrshare.com/) 网站提供的 [SSCAP/SSTAP 小工具](https://www.ssrtool.com/tool/free_ssr ) 可以使用无密码的非实时订阅如下:

```bash
## SSRShare
https://raw.githubusercontent.com/AmazingDM/sub/master/ssrshare.com 
## 其他
https://aoxuaudaadaoeu.herokuapp.com/subscribe
https://shadowsocks-share.herokuapp.com/subscribe?valid=1
```





## 手机在海外翻墙回国

以色列的服务商还屏蔽了一些国内网站，可以通过修改DNS服务器移除效果，比如 Google Public DNS。手机翻墙回国推荐下面这三款app: [解锁通](https://www.jiesuotong.com), [穿梭](https://www.transocks.com)(有广告), 快帆.





## 网易云音乐海外播放限制破解


如果点击播放，会提示“由于版权保护，您所在的地区暂时无法使用。” 可以通过下列方式破解： 用国内服务器反向代理网页端地址 music.163.com。桌面版的网易云音乐去除海外版权的一种方法是修改hosts如下：

```shell
# 网易云音乐服务器反代 (yizhiheng 提供，服务器位于纽约)
207.148.27.51 music.163.com
# 归属地查询服务器反代
207.148.27.51 ip.ws.126.net
# HTTPS DNS 服务器屏蔽
0.0.0.0 music.httpdns.c.163.com
# m10 服务器
125.39.1.27 m10.music.126.net
```
更多服务器ip参见由季寻梦赞助提供的: [通过修改 Hosts/DNS/PAC 实现海外收听网易云音乐](https://jixun.moe/post/oversea-netease-cloud-music-by-hosts/)。~~季寻梦还提供了反代的DNS的服务器以及一个 pac 文件~~. 这一方法的缺点是服务器远，用的人多，导致有点卡；且不能使用浏览器在线收听和下载。



### 更好的方式

使用 Chrome 插件 [NetEaseMusicWorldPlus](https://github.com/nondanee/NetEaseMusicWorldPlus)。使用普通模式，导入[^1]最适合的 CDN：

```shell
ping ws.acgvideo.com
ping cdnetworks.com
```

使用上述ping 分别寻找最优的音乐资源CDN服务器和最优的图片资源CDN服务器。然后将其 ip 地址写入 hosts：

```shell
14.0.41.190 m10.music.126.net
148.253.238.205 p1.music.126.net
148.253.238.205 p3.music.126.net
148.253.238.205 p4.music.126.net
```

[^1]: 方法参见：https://github.com/acgotaku/NetEaseMusicWorld。



## 利用 BIU 电脑账号使用 Putty Sockets 5 代理翻墙

因为通过Sockets 5代理, 所以查找文献时候会自动登录 Bar-Ilan 的公共账号. 

1. 下载putty, 新建一个 session: `BIU-putty`. HostName 为 `planet.cs.biu.ac.il`, Port 保持默认22.
2. 在左侧 Category> Connection > SSH > Tunnels, 填入一个 Source port `4000`. 使用 Dynamic + Auto.
3. Add 保存为一个 D4000, 切回 session 保存. Open 启用Putty, 输入账号`zhangwe1` 和密码.
4. Chrome 下载 SwitchyOmega, 并新建一个代理, 协议为 `SOCKS5`, 代理服务器为 `127.0.0.1`, 端口为之前设定的 `4000`. 保存
5. 现在启用代理就可以开始畅游网络~
6. 如果putty需要自动登录, 参见[PUTTY设置不用密码直接登录linux服务器](https://blog.csdn.net/lincy100/article/details/7007939). 用puttygen生成ppk私钥. 选择Connection>SSH>Auth，在“Private key file for authentication”输入密钥的路径. 然后在链接>数据>自动登录用户名输入登陆的用户名，比如`zhangwe1`. 
7. 之后需要添加 "authorized_keys" 到学校根目录中的 .ssh 目录中.



参考链接: 

1. BIU math CS help: <http://ezra.cs.biu.ac.il/>.
2. [如何通过 Putty 连接 SSH 代理翻墙](https://jingpin.org/putty-ssh-tunnel/).



## 使用 Google Cloud Platform 安装SSR

注意安装 SSR 之后，用Oneclickstack搭建LNMP以后将导致 SSR 不可用. 因此 LNMP 和 SSR 要分开用两个vm实例!



### 创建VM实例

申请好GCP以后, 创建VM实例. 通过`创建实例`来创建一个虚拟机。名称：随意输入; 地区：建议asia-east1-c; 机器类型：小型（建议）/微型. 启动磁盘单击更改 – Ubuntu 16.04 LTS; 防火墙：允许HTTP流量，允许HTTPS流量



### 静态 IP 和防火墙设置

1. 左侧导航 – 计算 – 网络, 外部IP地址 – 选择一个IP – 类型调整为静态.
2. 创建两次防火墙规则，一次出站、一次入站：防火墙规则 – 创建防火墙规则（未提及的全部默认）：流量方向`入站` (resp. `出站`)、来源IP地址`0.0.0.0/0`、协议和端口`全部允许`。

   

### 配置 SSR 以及 BBR

1. 进入实例控制台 – SSH – 在浏览器窗口中打开

2. 安装SSR，根据[一键安装脚本](https://shadowsocks.be/9.html)提示来:

   ```shell
   # 获取管理员权限
   sudo su
   # 一键安装脚本
   wget --no-check-certificate https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocksR.sh
   chmod +x shadowsocksR.sh
   ./shadowsocksR.sh 2>&1 | tee shadowsocksR.log
   # 安装BBR加速
   wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && ./bbr.sh
   ```

3. 重置VM实例后，打开ssh，输入：

   ```shell
   sudo su
   # 验证 BBR 是否成功
   sysctl net.ipv4.tcp_available_congestion_control
   # 若出现以下提示，即表示bbr安装成功
   net.ipv4.tcp_available_congestion_control = bbr cubic reno
   # 重启 SSR
   /etc/init.d/shadowsocks restart
   ```

   

> 参考链接: [使用Google Cloud Platform(GCP)安装SS教程](http://www.mzh.ren/gcp-free-ss.html).



## VPN 推荐

[VPN大大](https://www.vpndada.com/best-vpns-for-china-cn/)是翻墙VPN推荐的好网站, 他推荐 [ExpressVPN](https://www.vpndada.com/go/expressvpn-cn), [VyprVPN](https://www.vpndada.com/go/vyprvpn-cn), [PureVPN](https://www.vpndada.com/go/purevpn), [NordVPN](https://www.vpndada.com/go/nordvpn-cn) 翻墙软件, 并提供优惠券.

1. ExpressVPN，来自潘登和张殷达的推荐。
2. [Baacloud](http://www.baavpn.net/)：杨思源的推荐
3. 翻墙回国内首选：[PureVPN](https://www.vpndada.com/go/purevpn) 