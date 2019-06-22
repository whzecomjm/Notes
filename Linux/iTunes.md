iPhone, iTunes 和 App Store
===

## 禁止iTunes自动备份

要想彻底禁止iTunes备份的话，可以按照如下方法操作：

**Windows用户：**

1. 关闭iTunes
2. 按下Windows徽标键+R（或者在“开始”菜单中选择“运行）
3. 将下面的代码复制进去之后运行 
	```batch
	"%CommonProgramFiles%\Apple\Apple Application Support\defaults.exe" write com.apple.iTunes AutomaticDeviceBackupsDisabled -bool true
	```
4. 打开iTunes
5. 连接iPhone，同步即可

参考文献：[关闭iTunes iPhone自动备份（Windows+Mac）及删除过期备份](http://blog.csdn.net/richeninfo/article/details/11254185)

## 使用 Apple Musics 一些技巧和心得

1. 手机删除歌曲，同步时会将电脑此歌曲再次放到手机里，并且生成新的播放列表。建议在手机中设置为 dislike，然后再到电脑删除后再同步手机。
2. [通过itunes播放的歌曲会自动添加到itunes资料库中](https://bbs.feng.com/read-htm-tid-7758964.html)
3. 可以通过修改文件信息添加音乐专辑封面，可以下载 ~~虾米音乐~~ [QQ音乐](https://y.qq.com/)的封面。

## iphone Home键按下卡两声

准备一根牙签就好，然后把home键用牙签按下去 绕着转圈 ，造成卡顿的就是绕圈时掏出来的渣。我测试过虽然没有出渣渣但是没有难听的声音了。

## iMessage

- imessage 蓝色
- 普通短信 绿色

