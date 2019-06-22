# 使用 InstantClick 预加载站内链接

由于这个博客数学公式有些多, 所以如果能在点击链接的过程中提前加载网页可以大大提升用户体验, 于是 Google 一波找到了 InstantClick. InstantClick 是一个能加快网站内页面打开速度的 JavaScript 库, 该库利用鼠标点击链接前的短暂时间进行预加载, 从而在感观上实现了迅速打开页面的效果. 在此之几年前折腾博客的时候其实我应该已经接触过, 不过当时用的是其他人的模板, 也没有具体去看. 

为了能优化网站, 使用 [cdn.js](https://cdnjs.com/) 中的[链接](https://cdnjs.cloudflare.com/ajax/libs/instantclick/3.0.1/instantclick.min.js), 将其引入到主题模板 footer.php 文件, 载入并初始化:

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/instantclick/3.0.1/instantclick.min.js" data-no-instant></script>
<script data-no-instant>InstantClick.init();</script>
```

本以为这样就大功告成, 但是事后发现这样会和 MathJax 发生冲突, 公式不会自动加载. 注意到这两个 js 引入语句里都有 `data-no-instant` 的字样, 于是搜索发现果然是这个问题. 我们可以[对某些特定链接禁用 instantclick](https://www.wpzhiku.com/instantclick/), 简单的方法就是在链接后面添加字段 `data-no-instant`, 比如 `<a href="/" data-no-instant>Home</a>`. 

不过为了能尽快解决, 搜索 MathJax + instantclick 即得到完整解决方法: [让InstantClick兼容MathJax、百度统计等](https://sangsir.com/archives/instantclick-statscode.html). 具体完整的foot.php代码如下 (放置到`</footer>`之后): 

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/instantclick/3.0.1/instantclick.min.js" data-no-instant></script>
<script data-no-instant>
InstantClick.on('change', function(isInitialLoad) {
  if (isInitialLoad === false) {
    if (typeof MathJax !== 'undefined') // support MathJax
      MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
    if (typeof prettyPrint !== 'undefined') // support google code prettify
      prettyPrint();
    if (typeof _hmt !== 'undefined')  // support 百度统计
      _hmt.push(['_trackPageview', location.pathname + location.search]);
    if (typeof ga !== 'undefined')  // support google analytics
        ga('send', 'pageview', location.pathname + location.search);
  }
});
InstantClick.init();
</script>
```

换成 pae 主题之后, main.js 也会和 instantclick.js 冲突, 解决方案如下:

```js
<script data-no-instant>
InstantClick.on('main', function() {
// 回调
});
InstantClick.init();
</script>
```

实验发现, 只使用 main.js 也是有预加载的.

7月14日更新: 把博客转到 [Google Cloud Platform](https://cloud.google.com), 速度提高了不少. 一直想把instantclick和 highlight 之间的矛盾调节一下也没弄好. 加上用KaTeX代替了mathjax, 所以感觉不需要instantclick. 暂时先关了吧.