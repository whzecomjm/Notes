# Typecho 使用指南

[TOC]

[Typecho](http://typecho.org/) 是一个简单，轻巧的博客程序。基于PHP，使用多种数据库储存数据。

## Typecho 回归记

离开博客一年多了，离开 Typecho 更是有两年多，有些怀念。就像它的宣传语一样，“念念不忘，必有回响”。近日我看到 Coding Pages 部署 Typecho 十分简单，于是重新开了我的博客。安装并测试完以后，我发现了一个意外的好消息：之前最让我苦恼的 MathJax 公式的一些小问题在 Typecho 的1.1新版本终于得到解决，现在再也没有转义数学公式的bug（比如连续的下划线、大括号等等）。

之前由于LaTeX数学公式和Markdown转义符号书写的冲突，每次本地(使用Typora)将文章写好之后, 转到博客都需要添加转义符号以适应它们两者之间的冲突. 这让我一直都很苦恼. 如今最新的 Typecho 1.1正式版使用更新的 Hyperdown Markdown引擎解决了这个Bug，让我可以安心回归博客. 这也是我现在不用 Hexo, Hugo 等静态博客的原因

今天找到了Typecho更新的内容, Typecho 使用新的 HyperDown 的 Markdown 编译器, 已经写入了自动识别两个美元符号之间的内容为数学公式, 参见 [HyperDown: Mathjax](https://github.com/SegmentFault/HyperDown/blob/686d494534ee88810afc8c4e9dfa8f08014a37ed/Parser.php#L397). 这很好的解决了我的问题. 不过也会有新的小问题, 就是当你真的描述两件物品的价格时, 相近(同一段)的两个美元符号也会识别为公式. 不过这都是小概率时间, 我也已经不care了.  (2018年3月3日)

由于 Coding Pages 7月以后不提供动态Pages, 转而使用和腾讯云合作的 Cloud Studio. 本来省得麻烦直接到时候用腾讯云的服务器, 结果弄好博客以后发现腾讯云Studio服务器在国内必须备案. 嫌麻烦, 故此转到 [GCP](https://cloud.google.com). 感觉速度还可以. (2018年7月14日)

一部分之前的数学博客文章可以参见我的[知乎专栏](https://zhuanlan.zhihu.com/whzecomjm)。2018年8月底简书开始支持数学公式, 我会同步这个博客内容到[我的简书主页](http://js.whzecomjm.com/).

[Typecho Themes](https://typecho.me) 和 [Typecho中文网](https://www.typechodev.com) 这两个网站非常好, 有很多插件和主题, 还提供一些小的代码和解决方案.



## Typecho 插件推荐

* JustArchives：如果懒得自己写一个归档页面的话可以用这个插件。
* Like：简单的点赞插件。
* Links：友情链接插件。
* Smiles：评论表情插件。
* SplitArchivePage：文章分页插件。当文章比较长时可以考虑用此插件，可以缓解读者的焦躁情绪。
* Sticky：文章置顶插件。
* TableOfContents：文章内部索引，使一些长且有比较详细的标题分级的文章便于阅读。
* Views：文章浏览量插件，支持最多浏览列表。
* [Comment2Wechat](https://github.com/YianAndCode/Comment2Wechat): 微信通知评论
* [KaTeX4Typecho](https://github.com/whzecomjm/KaTeX4Typecho).



## Typecho 主机推荐

1. [优易主机](http://www.cefhost.cn/hk-hosting.html): 价格最低; 有时候还会打折, 原价89一年, 300MB空间, 8G流量, 免费SSL
2. [主机壳](https://www.zhujike.com/#/index): 99元一年, 300MB空间, 2G+6G流量, 有CDN
3. [有家主机](https://www.youjiazhuji.com/freehosting.shtml): 有免费虚拟主机, 还挺好用. 1G储存, 50G流量. 已经申请一个账号. 账号密码在fox邮箱可以找到.
4. [景安网络主机](http://host.zzidc.com/): 老牌主机, 也有免费虚拟空间(需要备案), 每天9点开始限量100台赠送. 小型带宽2m的主机只要49元每年. 另有附送备案幕布的129元10M主机只收10元. 国外主机199起.

## 文件和文件夹权限

近日安装了一个论坛程序 Xiuno BBS。但是发现发帖时无法上传图片，因为论坛肯定要这个功能的。而在后台看到原因貌似是`/home/usr/.upload` 不可写。翻了 Xiuno BBS的官方论坛，发现很多人都有这个问题。可是一般的解决方案是修改 `php.ini`。

但是有些主机提供商不会让这个文件可见。解决方法如下：**在根目录**（里面通常会有 `.php` 等文件夹，是你所能进入的最顶级目录）**下新建一个755的 `.upload` 文件夹**。之后我发现这也同样解决了我的 Typecho 不能上传文件的问题。

一个类似的问题是**500错误**. 把typecho的777的目录和文件改为755, 否则虚拟空间可能会报500错误: [修改远程服务器文件出现500错误并且提示XXX目录is writeable by group的解决方法](https://blog.csdn.net/tarajk05/article/details/41029855).

**最直接的方法**是给每个目录文件重新写入权限: 

```bash
# 所有文件夹 755
$ find . -type d -exec chmod 0755 {} \;
# 所有文件 644
$ find . -type f -exec chmod 0644 {} \;
```

或者在vps中仅仅给予php[正确赋予权限](http://blog.51cto.com/msiyuetian/1920161)方法是 `chown -R php-fpm.php-fpm /data/www/typecho`. 



## 书写 functions.php 方法

下面通过书写两个函数例子, 一个是开启 MathJax/KaTeX, 另一个是开启 InstantClick. 我们在 functions.php 中写入下列模板

```php
$enableMathJax = new Typecho_Widget_Helper_Form_Element_Radio('enableMathJax',
    array('1' => _t('开启'),
    '0' => _t('关闭')),
    '0', _t('MathJax/KaTeX 支持'), _t('默认为关闭。<br/>单行：<code>$...$</code>；<br/>多行：<code>$$...$$</code>。'));
$form->addInput($enableMathJax);

$enableInstantClick = new Typecho_Widget_Helper_Form_Element_Radio('enableInstantClick',
    array('1' => _t('开启'),
    '0' => _t('关闭')),
    '0', _t('开启Instant Click'), _t('默认为关闭'));
$form->addInput($enableInstantClick);
```
(将上述mathjax全部改成想要的.)

之后在主题适当处加入实行代码, 代码前后加入如下语句即可:

```php
<?php if ($this->options->enableMathJax == 1): ?>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.10.0-rc.1/katex.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.10.0-rc.1/katex.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.10.0-rc.1/contrib/auto-render.min.js"></script>
<script>
    renderMathInElement(document.body,
   {
              delimiters: [
                  {left: "$$", right: "$$", display: true},
                  {left: "$", right: "$", display: false}
              ]
          }
  );
</script>
<?php endif; ?>

    
<?php if ($this->options->enableInstantClick == 1): ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/instantclick/3.0.1/instantclick.min.js" data-no-instant>
</script>
<script data-no-instant>
InstantClick.on('change', function(isInitialLoad) {
   if (isInitialLoad === false) {
   if (typeof MathJax !== 'undefined') // support MathJax
     MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
   if (typeof prettyPrint !== 'undefined') // support google code prettify
     prettyPrint();
 }
});
InstantClick.init();
</script>
<?php endif; ?>
```



## 使用 Google Cloud Platform 安装Typecho

首先创建一个VM实例, 选择600M微小内存即可, 安装ubuntu 16. 首先使用 `sudo passwd root`将 root 用户密码改为`root`. 或者直接使用 `sudo su`.

### 1. 安装环境

安装好以后打开自带ssh, 按照教程[VPS搭建Typecho博客](https://segmentfault.com/a/1190000008655555)一步步做, 使用 [Oneinstack](https://oneinstack.com) 脚本安装, 可以去官网获取或者输入

```sh
apt-get update -y
apt-get -y install wget screen curl python
wget http://mirrors.linuxeye.com/oneinstack-full.tar.gz && tar xzf oneinstack-full.tar.gz
./oneinstack/install.sh --nginx_option 1 --php_option 4 --phpcache_option 1 --php_extensions imagick --phpmyadmin  --db_option 2 --dbinstallmethod 1 --dbrootpwd oneinstack --pureftpd  --redis  --memcached  --iptables  --reboot 
```

上述是自动安装 lnmp, 等待~~二十分钟~~(我用了100多分钟)左右，安装成功后，VPS会自动重启。重启之后创建网站, SSH重新连接上VPS并输入如下代码创建网站。 

```sh
cd oneinstack
./vhost.sh
```

依次按照对话框进行回答配置，博主个人这样配置。其中网站目录默认在`/data/wwwroot/whzecomjm.com`下面. 

而conf文件分别在 

```basic
/usr/local/nginx/conf/vhost/whzecomjm.com.conf
/usr/local/apache/conf/vhost/whzecomjm.com.conf
```

我们之后安装完 typecho 开启rewrite功能需要修改这两个文件及其权限(可能需要777). 另外我们还要安装sqlite, 只需要执行[安装命令](https://www.cnbanwagong.com/51.html): `apt-get install sqlite sqlite3` 即可. 

### 2. 安装Typecho

我们打开ssh客户端右上角的上传功能, 上传后将安装包文件用 `mv` 移动到网站目录, 再在网站根目录用 `unzip` 解压. 之后我们先要去绑定域名, 首先需要把外部ip调为静态, 在 GCP `vpc网络->外部IP地址` 固定. 同时添加一个入站允许的防火墙. 之后把我们网站域名 `A` 指向到所属 ip. 然后我们就可以开心地打开网站主页安装typecho.

结果发现无法连接到数据库, 这是因为 sqlite 和 typecho 没有权限新建数据库, 只需要将Typecho 当中的`/usr` 目录更改权限为777即可:

```bash
chmod -R 777 /data/wwwroot/whzecomjm.com/usr
```

注意这里sqlite和mysql不一样,不需要手动创建数据库,否则会出错. 

好了之后就能愉快导入数据, 甚至我们可以导入mysql导出的数据库直接使用. 不过之后的rewrite发现有问题. 我们可以修改 nginx和 apache 配置文件的权限777, 这样就可以让typecho自动写入. 

```bash
chmod 777 /usr/local/nginx/conf/vhost/whzecomjm.com.conf
chmod 777 /usr/local/apache/conf/vhost/whzecomjm.com.conf
```

也可以根据需要自己设置一下, 具体参见: [Typecho开启伪静态并隐藏index.php](https://www.typechodev.com/theme/478.html). 

其中apache配置只需要在网站目录根目录新建一个`.htaccess `文件, 内容即

```php
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase /
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^(.*)$ index.php [L,E=PATH_INFO:$1]
</IfModule>
```

而 nginx 配置改为如下:

```php
server {
        listen          80;
        server_name     yourdomain.com;
        root            /home/yourdomain/www/;
        index           index.html index.htm index.php;

        if (!-e $request_filename) {
            rewrite ^(.*)$ /index.php$1 last;
        }

        location ~ .*\.php(\/.*)*$ {
            include fastcgi.conf;
            fastcgi_pass  127.0.0.1:88;
        }

        access_log logs/yourdomain.log combined;
    }
```

修改完之后重启nginx. 

```sh
/usr/local/nginx/sbin/nginx -s reload
```

自此大功告成!!!

> **注意**: 用Oneclickstack搭建LNMP以后,ssr不可用. 所以搭建typecho的VM实例要和ssr的分开!

### 关于nginx和 apache

其实没必要同时安装nginx和 apache, 因为它们是不同的选择. 在这个示例中nginx监听80端口, 而apache监听88. typecho是默认安装到80的,所以其实apache没有什么用. 它们二者区别参见: [Nginx 和 Apache 各有什么优缺点？](https://www.zhihu.com/question/19571087)

在linux服务器推荐使用前者, 它是异步的能减轻服务器压力, 虽然没有 apache那么多功能强大, 但是已经够用.

其他Linux命令参考: [Linux查看系统信息的一些命令及查看已安装软件包的命令](http://cheneyph.iteye.com/blog/824746).

whzecomjm
2018年7月12日

### 定期备份Typecho站点文件和数据库

```bash
zip -r /home/whzecomjm/tebackups/typecho-sqlite-20180715.zip /data/wwwroot/whzecomjm.com/*
```

之后通过Chrome自带SSH下载即可.

### 定期清理 GCP 服务器内存

第一个命令可以查看内存使用情况, 之后的命令用来[清理内存](https://www.cnblogs.com/52linux/archive/2012/03/08/2385399.html):

```sh
free -m 
echo 1 > /proc/sys/vm/drop_caches
```



## 使用 Cloud Studio 安装typecho

首先 Cloud Studio 可能关闭了海外用户权限, 如果在海外使用,  请[联系客服解决](https://coding.net/u/coding/p/Coding-Feedback/topic/395771). 打开 Cloud Studio 以后首先选择导入 Coding 工作区间. 之后以为按照[帮助:绑定域名](https://coding.net/help/cloud-studio/domain) 一样, 使用php运行环境, 就能正常运行:

```php
php -S 0.0.0.0:8090 & // 后台运行
ppp -S 0.0.0.0:8090 // 前台运行
```

打开网址能够出现install.php界面但是怎么连接都连不到. 官方只说了密码是 `coding`, 折腾了好久, 发现两个问题, 一是用户名应该是 `root`, 二是需要创建 mysql 数据库.

首先我们需要[修改/确定root密码](https://blog.csdn.net/weixin_36210698/article/details/72857366)为 `coding`:

```sh
sudo passwd root
```

修改以后打开mysql, 并且[新建数据库](https://blog.csdn.net/zoro_13/article/details/16981829):

```shell
su
mysql -h localhost -uroot -p
// 输入密码coding
// 这样能打开mysql
mysql> create datebase typecho; // 新建数据表, 分号一定要加上.
```

如果不能正常打开 mysql, 请使用 `service mysql restart` 重启 mysql 再进行上述操作.

之后安装typecho按照默认, 用户名 root, 密码 coding , 数据表名字 typecho 即可. 

> 注意 git push 时候不能用 root, 添加一个控制台使用git就好.

但是悲剧的发现, 只要安装好博客以后就会弹出需要备案的警告, 等于最终无功而返. orz. 还是没有之前的 WEBIDE 好用.

## 其他一些小的代码

### 1. 文章显示上次修改时间

```php+HTML
<p>上次修改时间: <?php echo date('Y-m-d H:i:s', $this->modified);?></p>
```

### 2. 前台添加编辑文章链接

我再 kibou_lite 主题中文章页面的头部导航加入只对管理员的编辑文章的链接.

```php+HTML
<?php if ($this->is('post')):?>
        <?php if($this->user->hasLogin()):?>
          <?php if($this->user->pass('administrator','true')):?>
            <a class="blog-nav-item" href="/admin/write-post.php?cid=<?php echo $this->cid;?>" target="_blank">编辑文章</a>
          <?php endif;?>
        <?php endif;?><?php endif;?>
```



### 3. 更换 Gravatar 服务器

直接打开Typecho安装目录下的`config.inc.php`文件，加入以下代码即可（加在任何位置都可）

```
define('__TYPECHO_GRAVATAR_PREFIX__', 'https://secure.gravatar.com/avatar/');
```



### 4. 外链用新的标签页打开

```js
<!-- open link in a new tab. -->
<script>
    function openExternalLinks() {
      for (var a = document.getElementsByTagName("a"), i = 0; i < a.length; i++) {
      var c = a[i];
      c.getAttribute("href") && c.hostname !== location.hostname && (c.target = "_blank");
      }
    }
openExternalLinks();
</script>
```



### 5. 解决php报错date():It is not safe to rely

具体解决方法：[修改php.ini配置文件](https://jingyan.baidu.com/article/2a138328a95186074b134f4f.html
).

在php.ini配置文件中找到： `;date.timezone =` ，把前面的分号去掉在 “=”后面加上时区。

```php
date.timezone = "Asia/Shanghai"
```

修改完后，重启apache即可。