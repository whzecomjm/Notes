# 代码段内的强制换行

实现pre标签中内容超出时换行css代码如下:

```css
pre { 
white-space: pre-wrap; /*css-3*/ 
white-space: -moz-pre-wrap; /*Mozilla,since1999*/ 
white-space: -pre-wrap; /*Opera4-6*/ 
white-space: -o-pre-wrap; /*Opera7*/ 
word-wrap: break-word; /*InternetExplorer5.5+*/ 
} 
```

加上以后也无法解决360chrome的换行问题, 其他浏览器上述代码就能解决.另外`overflow:auto;` 和 `-webkit-overflow-scrolling: touch;` 是用来显示滚动框, 可以在源代码去掉. (实际上去不去掉都可以, 无妨)

### 参考链接:

- [pre标签中内容超出时换行](http://blog.csdn.net/GreyBearChao/article/details/74356794).
- [css教程:pre标签里的文本换行](https://www.51test.net/show/1891135.html).