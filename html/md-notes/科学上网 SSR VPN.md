# 科学上网

科学上网太重要！特别是在国内用不了谷歌太难受。一个比较绿色的方法就是使用hosts。不过这个方法要经常更新，不一定保证一直有效。另外可以尝试一下无界科学上网和 SSR，虽然比较麻烦。同样在海外又想要看国内视频听国内歌。

[TOC]


## 酸酸乳——SSR

iOS版本可以使用APP:  **Potatso Lite**. PC 可以在Github下载SSR. SSR可以使用ssr链接快速配置，可用地SSR免费账号分享网站：

- [poro](http://poro.cx/)
- [SSRTool](https://ssrtool.us/tool/free_ssr)
- [FreeSS](https://ssx.re/)
- https://free-ss.site/



SSR 可以单独使用，如果是为了省流量，可以使用 pac 模式，并且定期手动更新pac 文件。这一做法缺点是某些不再pac的被屏蔽小网站可能无法通过代理。如果不考虑流量，可以设置代理规则：`绕过局域网和大陆`，并选择`全局模式`的系统代理模式。

当然 SSR 还可以配合 SwitchyOmega 插件使用：



### SSR 配合 SwitchyOmega 使用

1. SSR设置系统代理模式：`直连模式`
2. SwitchOmega 插件情景模式中添加一个代理服务器`SSR`，协议为 `SOCKS5`, 代理服务器为 `127.0.0.1`, 端口为 `1080`. （SSR的默认本地端口）
3. 打开规则列表设置中选择`AutoProxy`，填入：

```html
https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
```

4. 切换规则中的规则列表规则选定为`SSR`，应用更改即可。

参考连接: [Google浏览器配置SwitchyOmega模式为auto switch](https://blog.csdn.net/u011068702/article/details/86624940).



### SSR订阅地址

很多免费SSR会一段时间后更改密码, 有的提供SSR地址订阅, 更加方便. 测试可用订阅如下:

```bash
## t.me/SSRSUB(反馈很好)：
https://raw.githubusercontent.com/ssrsub/ssr/master/ssrsub
## voken100g AutoSSR
https://raw.githubusercontent.com/voken100g/AutoSSR/master/online
https://raw.githubusercontent.com/voken100g/AutoSSR/master/stable
## 敲门砖：
https://qiaomenzhuanfx.netlify.com
## muma16fx(稍微有点慢)
https://muma16fx.netlify.com
```



参考链接:

- 碧海小站. [SSR免费节点订阅地址](https://bhqt.ltd/?p=240)
- [SSCAP/SSTAP 小工具](https://www.ssrtool.com/tool/free_ssr )





## 网易云音乐海外播放限制破解

以色列的服务商屏蔽了一些国内网站，可以通过修改DNS服务器移除效果，比如 Google Public DNS。


在网易云音乐中，有时我们点击播放，会提示“由于版权保护，您所在的地区暂时无法使用。” 可以通过下列方式破解： 用国内服务器反向代理网页端地址 music.163.com。桌面版的网易云音乐去除海外版权的一种方法是修改hosts如下：

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
更多服务器ip参见由季寻梦赞助提供的: [通过修改 Hosts/DNS/PAC 实现海外收听网易云音乐](https://jixun.moe/post/oversea-netease-cloud-music-by-hosts/)。这一方法的缺点是服务器远，用的人多以后会有点卡；且不能使用浏览器在线收听和下载。



### Chrome 插件

使用 Chrome 插件 [NetEaseMusicWorldPlus](https://github.com/nondanee/NetEaseMusicWorldPlus)。使用~~普通模式~~，[导入](https://github.com/acgotaku/NetEaseMusicWorld)最适合的 CDN hosts. 普通模式现已不可用, 直接使用增强模式即可.



### 手机在海外享受国内影音

手机翻墙回国推荐下面这三款App: [解锁通](https://www.jiesuotong.com), [穿梭](https://www.transocks.com)(有广告), 快帆.



## 使用 Putty 创建 SOCKS5 代理

使用BIU的ssh账号做代理。通过此代理, 查找文献时候会自动登录 BIU 的公共账号. 步骤如下：

1. 使用putty新建一个session: `BIU`. HostName 为 `planet.cs.biu.ac.il`, Port 保持默认22.

2. 在左侧 Connection > SSH > Tunnels, 填入一个 Source port `4000`. 使用 Dynamic + Auto. Add 保存后产生一个 D4000, 切回 session 保存. 

3. Open 启用Putty, 输入账号`zhangwe1` 和密码.

4. 为了防止putty自动断线，选择 Connection，把 seconds between keepalives 设为 10；low-level TCP connection options 的两个选项都勾上。

5. Chrome 下载 SwitchyOmega 扩展, 并新建一个代理, 协议为 `SOCKS5`, 代理服务器为 `127.0.0.1`, 端口为之前设定的 `4000`. 

6. 进一步地，可以设置putty自动登录. 用puttygen生成并保存ppk私钥. 选择Connection>SSH>Auth,在“Private key file” 输入密钥的路径. 然后在Connection>Data>Auto-login username 中输入登陆的用户名`zhangwe1`. 

7. 添加 "authorized_keys" 到学校根目录中的 .ssh 目录中.

8. 现在启用Putty连接打开SwitchyOmega 对应代理就可以开始畅游网络~

   

参考链接: 

1. BIU math CS help: <http://ezra.cs.biu.ac.il/>.
2. Putty SSH 代理：[如何通过 Putty 连接 SSH 代理翻墙](https://jingpin.org/putty-ssh-tunnel/).
3. Putty的自动登录：[PUTTY设置不用密码直接登录linux服务器](https://blog.csdn.net/lincy100/article/details/7007939)



## 使用 GCP 安装SSR

### 创建 VM 实例

申请好 Google Cloud Platform 账号以后, 创建VM实例. 通过`创建实例`来创建一个虚拟机。名称：随意输入; 地区：建议asia-east1-c; 机器类型：小型（建议）/微型. 启动磁盘单击更改 – Ubuntu 16.04 LTS; 防火墙：允许HTTP流量，允许HTTPS流量



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

   

参考链接: 

- [使用Google Cloud Platform(GCP)安装SS教程](http://www.mzh.ren/gcp-free-ss.html).
- [使用Google Cloud Platform(GCP GCE)安装SSR+BBR教程](https://suiyuanjian.com/124.html)



> 注意：安装 SSR 之后，用Oneclickstack搭建LNMP (PHP+SQL环境) 将导致 SSR 不可用. 因此这两者要使用两个vm实例!



## VPN 推荐

[VPN大大](https://www.vpndada.com/best-vpns-for-china-cn/)是翻墙VPN推荐的好网站, 他推荐 [ExpressVPN](https://www.vpndada.com/go/expressvpn-cn), [VyprVPN](https://www.vpndada.com/go/vyprvpn-cn), [PureVPN](https://www.vpndada.com/go/purevpn) 翻墙软件, 并提供优惠券.

1. ExpressVPN，来自Panda和Yinda的推荐。
2. 蓝灯: 不支持 iOS
3. 2019新兴VPN: [PandaVPN](https://www.ipandavpn.com/), 黑五2折$1.99/m 买一年送一年.
4. [Baacloud](https://www.baacloud.com/)：Siyuan的推荐
5. 翻墙回国首选：[PureVPN](https://www.vpndada.com/go/purevpn) 





whzecomjm 
2019-12-05



