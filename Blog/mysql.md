博客Mysql代码
===

## 数据清理(Wordpress)

写博客做的最多的事情就是对内容修修改改，改来改去草稿和其他垃圾也多了，所以数据库清理是很有必要的。下面是一种清理 Wordpress 的无用数据的代码。Typecho 等程序数据库清理类似。

```sql
DELETE FROM wp_posts WHERE post_type='post' && post_status#='publish';
DELETE FROM wp_posts WHERE post_type='revision' && post_status#='publish';
DELETE FROM wp_postmeta WHERE meta_key = '_edit_lock';
DELETE FROM wp_postmeta WHERE meta_key = '_edit_last';
DELETE FROM wp_postmeta WHERE meta_key = '_revision-control';
SELECT * FROM `wp_options` WHERE `option_name` REGEXP 'site';
SELECT * FROM `wp_options` WHERE `option_name` REGEXP 'transient';
```

## 更换域名后修改链接（Typecho）

和 Wordpress 一样，数据库的备份文件一般都是为了能够出错后还原，但是有时候换域名或者是从测试站调试好的数据导入正式站，都要修改网址。Typecho 的数据库中有网址的共有四处，如果可以进入 phpmysql，我们可以用 mysql 语句统一替换。

Users 表里面的作者主页可以手动修改一下。Options 表里关于主页 url 的声明也是可以手动修改的。而另外两个 contents 和 comments 表，我们需要用到 mysql 的替换功能，代码如下：

```sql
UPDATE `typecho_comments` SET `url` = replace (`url`,'http://X.com/','http://Y.com/');
UPDATE `typecho_contents` SET `text` = replace (`text`,'http://X.com/','http://Y.com/');
```