# Web Scraper 使用教程

首先下载安装 [Web Scraper](https://chrome.google.com/webstore/detail/web-scraper/jnhgnonknehpejjnehehllkliplmbmhn) 扩展. 在网页打开 F12, 选择最后的 Web Scraper, 新建一个 sitemap.

选择需要提取器(Selectors), 就可以抓取了. 如果需要抓取链接内的内容, 提取器选择类型为 link, 再新建一个子提取器, 提取内容 text 即可.

之后在 Sitemap 中选择 Scrape, 等待结束即可.

-----

也可以用 Element (需要包含子提取器的元素内容, 此父提取器需要勾选`multiple`) , 再创建子提取器(注意此处的提取器不要勾选`multiple`), 则可以在同一页面提取多重数据.  比如 [Web Scraper——简单爬取豆瓣音乐250](http://wangpeng.life/2018/04/17/Web-Scraper%E2%80%94%E2%80%94%E7%AE%80%E5%8D%95%E7%88%AC%E5%8F%96%E8%B1%86%E7%93%A3%E9%9F%B3%E4%B9%90250/) .



whzecomjm
2019-12-10

