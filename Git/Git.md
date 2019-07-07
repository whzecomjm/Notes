Git学习笔记
===

git是一个分布式版本控制软件，最初由林纳斯·托瓦兹（Linus Torvalds）创作，于2005年以GPL发布。最初目的是为更好地管理Linux内核开发而设计。

常见的Git托管平台有： [Github](https://github.com), [Coding](https://coding.net/), [Gitee](https://gitee.com/)。其中 Coding 升级为 [腾讯云开发者平台](https://dev.tencent.com/user), 可以在线使用 WebIDE. 2019年一月, 在微软收购 Github 以后, 推出了免费的无限个私人仓库.

注: 由于Github Release放在Amazon S3，而后者被封，注意SSR要开全局才可以下载。

[TOC]

## Git 配置方法

Windows下有现成的Git for Windows，配置比较简单，详情参见参考文献 [Git for Windows 配置](http://www.cnblogs.com/monodin/p/3268679.html)。

如果是minigit的绿色版, 需要先把 `D:\Program Files\Git\cmd` 和 `D:\Program Files\Git\usr\bin` 放到系统环境变量. 前者是为了能使用git, 后者能使用ssh.

下面介绍Linux下的[git的相关配置](https://github.com/chenzhiwei/linux/tree/master/git)（**不要使用root终端**）：

1. 下载Git，`sudo apt-get install git`（Ubuntu自带）

2. 配置Git config 全局设置.

    ```shell
    //配置作者信息
    git config --global user.name whzecomjm
    git config --global user.email whzecomjm@foxmail.com
    //修正中文文件名乱码
    git config --global core.quotepath false
    //不转换换行编码
    git config --global core.autocrlf false 
    //重新设置通信缓存大小
    git config --global http.postBuffer 524288000
    //修正GUI查看分支历史中文乱码
    git config --global gui.encoding utf-8 
    git config --global i18n.commit.encoding utf-8 
    git config --global i18n.logoutputencoding utf-8 
    //git命令缩写
    git config --global alias.cm commit
    git config --global alias.st status
    git config --global alias.ps push
    ```

3. 配置SSH：详见[Github 官方帮助](https://help.github.com/articles/connecting-to-github-with-ssh/)。添加一个ssh密钥。 

    ```shell
    ssh-keygen -t rsa -b 4096 -C "whzecomjm@foxmail.com"
    ```

    也可以使用`puttygen`产生ssh密钥, 再 `export to openssh`.

4. 将公钥复制到Github, 私钥保存到 `.ssh` 文件夹内, 把`.ssh`内的`config`文件设置如下. 检查ssh通道可用（必须检查，比如：`ssh -T git.coding.net`）。

  ```shell
  Host github.com
      User git
      Hostname github.com
      PreferredAuthentications publickey
      IdentityFile ~\.ssh\putty-git
  ```

5. 开发：获取到源码之后，就可以进行开发，修改完文件以后，可以更新git仓库。服务器仓库更新也能拉取到本地。

    ```shell
    //添加(-a 相当于git add .)并提交代码，并添加提交说明
    git commit -am "commit directions" 
    // 推送到远程仓库
    git push --set-upstream origin master
    //从服务器origin更新本地代码
    git fetch origin
    git merge origin/master
    //pull相当于fetch+merge
    git pull origin master
    ```

更多Git指令参见：[Git toturial](https://github.com/whzecomjm/AppsNotes/blob/master/git/git_toturial).



### Git 一些常用配置和操作

3. Git 生成变更**历史记录log**文件：`git log > ChangeLog`。

4. .git 文件太大不想全部clone到本地，可以设置commit深度，比如可以**只克隆最近一次commit**：`git clone git@git.coding.net:whzecomjm/whzecomjm.git --depth 1`.

5. 完全[重建](https://www.zhihu.com/question/29769130/answer/45546231)版本库: 

   ```shell
   rm -rf .git
   git init
   git add .
   git cm "first commit"
   git remote add origin <your_github_repo_url>
   git push -f -u origin master
   ```

   

## Github Pages 自定义网站绑定子域名

1. 将`usename.github.io`绑定**顶级域名**。
2. 创建一个项目和它的gh-pages分支。
3. 在项目的 gh-pages 分支用cname文件绑定子域名。
4. 在 DNSPod 等域名解析管理中添加cname记录。



### 同时使用 Github 和 Coding 托管博客

因为 Github 和 Coding 的 Pages 使用不同的分支，所以无法在 remote 里添加两个 url（如果分支相同可以通过执行如 `git push all gh-pages` 同时 push。具体参见[链接](http://liberize.me/tech/host-your-blog-on-both-github-and-gitcafe.html)），可以在 .git/config 中添加一个 alias 来实现：

```
[alias]
    publish = !sh -c \"git push github master && git push gitcafe master:gh-pages\"
```
当需要 push 的时候，只需执行 `git publish` 就可以了。

## Git回国后不能正常使用ssh push

```
ssh: connect to host github.com port 22: Operation timed out
fatal: Could not read from remote repository.
Please make sure you have the correct access rights and the repository exists.
```
回国后push博客文件弹出上述错误，github的解决方法需要在 `~\.ssh\config` （没有此文件自己新建一个即可） 加入如下内容：

```
Host github.com
   Hostname ssh.github.com
   Port 443
Host git.coding.net
   Hostname git-ssh.coding.net
   Port 443
```
产生上述问题的原因是网络运营商禁用了22端口，导致无法使用ssh，只要更改端口443即可。对于coding，找了老半天才找到[可用的端口](http://www.aiweibang.com/yuedu/98659541.html)。



## Git Tag 用法

首先说一下作用：Git 中的tag指向一次commit的id，通常用来给开发分支做一个标记，如标记一个版本号。

下面就说一下具体的用法：

1. 添加标签： `git tag -a version -m "note"`

   注解：git tag 是打标签的命令，-a 是添加标签，其后要跟新标签号，-m 及后面的字符串是对该标签的注释。

2. 提交标签到远程仓库：`git push origin -tags`
   注解：就像git push origin master 把本地修改提交到远程仓库一样，-tags可以把本地的打的标签全部提交到远程仓库。

3. 删除标签：`git tag -d version`
   注解：-d 表示删除，后面跟要删除的tag名字

4. 删除远程标签：`git push origin :refs/tags/version`
   注解：就像 `git push origin :branch_1` 可以删除远程仓库的分支branch_1一样， 冒号前为空表示删除远程仓库的tag。

5. 查看标签：`git tag` 或者 `git tag -l`



### 重命名tag

其实是先给个新名字,再删掉老名字:

```git
git tag new old
git tag -d old
git push origin :refs/tags/old
git push --tags
```

最后其他用户和电脑要运行代码 `git pull --prune --tags` 同步变化.



## 参考文献

1. [Git 魔法（教程）](http://www-cs-students.stanford.edu/~blynn/gitmagic/intl/zh_cn/ch02.html)
2. [Git 命令大全](https://github.com/whzecomjm/Notes/blob/master/git/git_toturial)
3. [Astral: 整理Starred项目](https://app.astralapp.com/dashboard)
5. [日新亭: Git的4个阶段的撤销更改](https://www.fengerzh.com/git-reset/)
6. [Git中tag的用法及作用](http://blog.csdn.net/u013399093/article/details/50511462) 
6. [Git只获取部分目录的内容（稀疏检出）](https://zhgcao.github.io/2016/05/11/git-sparse-checkout/) 
