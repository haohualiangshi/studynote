---
title: frontEndStudy-1
tags: [前端之路,html,css]
---

## 前端进阶之路-HTML+CSS

### HTML

**概念：**HTML是用来描述网页的一种 **超文本标记语言**；由尖括号`<>`包围关键词组成；通常成对出现

##### 标题

标题是通过`<h1>-<h6>`等标签进行定义的；

~~~html
<h1>我是h1标题<h1>
~~~

##### 段落

段落是通过`<p>`标签进行定义的；

~~~html
<p>我是一段文字</p>
~~~

##### 链接

链接是通过`<a>`标签定义的：

~~~html
<a href="https://haohualiangshi.github.io/">这个链接会跳转到我的博客</a>
~~~

**图片**

图片是通过`<img>`标签定义的。

~~~html
<img src="链接地址"/>
~~~

**属性**

标签可以拥有属性；以健值对的形式出现；

**文本格式化标签**

HTML定义了很多提供格式化输出的元素；如粗体或者斜体

| 标签                | 描述         |
| ------------------- | ------------ |
| `<b></b>`           | 定义粗体文本 |
| `<big></big>`       | 定义大号子   |
| `<em></em>`         | 定义着重文字 |
| `<i></i>`           | 定义斜体字   |
| `<small></small>`   | 定义小号子   |
| `<strong></strong>` | 定义加重语气 |
| `<sub></sub>`       | 定义下标字   |
| `<sup></sup>`       | 定义上标字   |
| `<ins></ins>`       | 定义插入字   |
| `<del></del>`       | 定义删除字   |

**计算机输出标签**

| 标签            | 描述           |
| --------------- | -------------- |
| `<code></code>` | 定义计算机代码 |
| `<kbd></kbd>`   | 定义键盘码     |
| `<var></var>`   | 定义变量       |
| `<pre></pre>`   | 定义预格式文本 |

**引用和术语定义**

| 标签                        | 描述         |
| --------------------------- | ------------ |
| `<abbr></abbr>`             | 定义缩写     |
| `<address></address>`       | 定义地址     |
| `<blockquote></blockquote>` | 定义长的引用 |

**定义css的方式**

* 外部样式：定义一个css文件，通过`<link>`标签引入

  ~~~html
  <link href="样式地址"/>
  ~~~

* 内部样式：通过`<style>`标签写在html内部

  ~~~html
  <style type="text/css">
    body {background-color: red}
    p {margin-left: 20px}
  </style>
  ~~~

  * 内联样式:通过`style`属性写在标签上

  ~~~html
  <p style="color: red; margin-left: 20px">
  ~~~

**表格**

表格通过`<table><tr><th></th></tr><tr><td></td></tr></table>`标签来定义

| 表格                  | 描述           |
| --------------------- | -------------- |
| `<table></table>`     | 定义表格       |
| `<caption></caption>` | 定义表格标题   |
| `<th></th>`           | 定义表格的表头 |
| `<tr></tr>`           | 定义表格的行   |
| `<td></td>`           | 定义表格单元   |
| `<thead></thead>`     | 定义表格页眉   |
| `<tbody></tbody>`     | 定义表格主题   |
| `<tfoot></tfoot>`     | 定义表格页脚   |
| `<col></col>`         | 定义表格列属性 |
| `<colgroup></group>`  | 定义表格列的组 |

**列表**：

* 有序列表

  ~~~html
  <ol>
  	<li>列表1</li>
  	<li>列表2</li>
  	<li>列表3</li>
   </ol>
  ~~~

* 无序列表

  ~~~html
  <ul>
  	<li>列表1</li>
  	<li>列表2</li>
  	<li>列表3</li>
   </ul>
  ~~~

* 自定义列表

  ~~~html
  <dl>
  	<dt>Coffee</dt>
  	<dd>Black hot drink</dd>
  	<dt>Milk</dt>
  	<dd>White cold drink</dd>
  </dl>
  ~~~

  



