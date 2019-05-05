---
title: frontEndStudy-1
tags:
  - 前端之路
  - html
  - css
date: 2019-05-05 10:29:15
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

### CSS

**概念：**css称为层叠样式表，可以通过权重实现样式的叠加覆盖；css样式由选择器和属性/属性值构成；

**权重：**权重指的是样式的优先级

* !important,加在样式属性值后。权重值为10000
* 内联样式。权重为1000
* id选择器。权重为100
* 类/伪类/属性选择器权重为10
* 标签选择器和伪元素选择器权重为1
* 通配符选择器/子选择器/相邻选择器/兄弟选择器权重为0；

| 选择器               | 例子    | 描述                                          |
| -------------------- | ------- | --------------------------------------------- |
| .class-name          | .bg     | 类选择器                                      |
| #id-name             | #id     | id选择器                                      |
| *                    | *{}     | 通配符选择器                                  |
| element              | div     | 元素选择器                                    |
| element,element      | div,p   | 并集选择器（选择器分组）                      |
| element element      | div div | 后代选择器                                    |
| element>element      | div>div | 子代选择器（子元素选择器）                    |
| element+element      | div+div | 兄弟选择器，符合条件的下一个兄弟元素          |
| [attribute]          | [href]  | 属性选择器                                    |
| [attribute=value]    |         |                                               |
| [attribute~=value]   |         | 选择属性包含指定值的所有元素                  |
| [attribute\| =value] |         | 选择属性带有包含指定值的的所有元素设置样式    |
| :link                |         | 伪类选择器，超链接点击之前                    |
| :visited             |         | 伪类选择器，超链接点击之后                    |
| :active              |         | 伪类选择器，获取焦点的状态                    |
| :hover               |         | 伪类选择器，鼠标悬停在标签上部                |
| :focus               |         | 伪类选择器，鼠标按下的状态                    |
| :first-letter        |         | 伪元素选择器， 向段落的第一个字符添加特殊样式 |
| :first-line          |         | 伪元素选择器，向段落的第一行添加特殊样式      |
| :first-child         |         | 伪类选择器，选择元素的第一个子元素            |
| ::before             |         | 伪元素，需要使用content属性配合               |
| ::after              |         | 伪元素，同上                                  |
| :lang(language)      |         |                                               |
|                      |         |                                               |

**分类：**按照功能可分为布局，修饰文案，背景；

* 布局：

  * 盒模型种类：标准盒模型和IE盒模型；区别是对待padding值和border不同的解决方案

    ~~~css
    box-sizing:content-box; //标准盒模型
    box-sizing:border-box;	// IE盒模型
    ~~~

  * 内边距:padding:padding-top padding-right padding-bottom padding-left;

  * 外边距:margin:margin-top margin-right margin-bottom margin-left;

  * 边框

    * 边框样式，可以定义多个样式；顺序是上右下左：border-style:border-top-style border-right-style border-bottom-style border-left-style;

      ~~~css
      p.aside {border-style: solid dotted dashed double;}
      ~~~

    * 边框宽度：可定义多个宽度：border-width:border-top-width border-right-width border-bottom-width border-left-width;

    * 边框颜色：可定义多个颜色；border-color: border-top-color border-right-color border-bottom-color border-left-color;

  * 外边距合并:当两个垂直外边距相遇时；他们将形成一个外边距；合并后的外边距的高度等于两个发生合并的元素中外边距最大的那个；

  * 定位：

    * `position:static`:元素文档正常生成；不脱离文档流；
    * `position:relative`:相对定位；脱离文档流；元素相对本身进行定位；但原本所占空间保留
    * `position:absolute`:绝对定位；脱离文档流；相对最近一个设置`position:relative/absolute/fixed`属性的父元素定位；
    * `position:fixed`:绝对定位；相对于视图进行定位

  * 浮动：`float`脱离文档流；使用`clear`清除浮动

* 修饰文案

  * 字体大小：`font-size`
  * 文本缩进：`text-indent`
  * 对齐方式:` text-align`
  * 文字间隔:
    * `word-spacing`：设置文字或者单词之间的间隔标准
    * `letter-spacing`: 设置字母间隔
  * 字符转换：`text-transform`处理文本的大小写
  * 文本装饰
  * 空白字符处理：`white-space`会影响到用户代理对源文档中空格/换行和tab字符串的处理
  * 设置文本方向：`text-direction`设置文本的对齐方向
  * 设置字体：`font-family`

  **demo：单行省略**

  ~~~css
  width:200px;
  overflow: hidden;
  text-overflow:ellipsis;
  white-space: nowrap;
  ~~~

  **多行省略；适用于`-webkit-`内核**

  ~~~css
  display: -webkit-box;
  height：300px;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden;
  ~~~

  

* 背景

  * 背景色：`background-color`

  * 背景图: `background-image:url(背景图路径)`定义引入的背景图路径

  * 背景平铺：`background-repeat`

  * 背景定位：`background-position`

  * 背景大小：`background-size`

  * 背景关联: `background-attachment`通过该属性可以声明图像相对于可视区是固定的活着滚动的；

  * 综合属性：`background:属性集合,空格隔开`

    ~~~css
    background:background-color background-image background-repeat background-position background-size background-attachment;
    ~~~

**颜色**：css中颜色有六种定义方法

* 十六进制：`#fff,#f2f3f4`
* RGB颜色：`rgb(0,0,255)`
* RGBA颜色：`rgba(255,0,0,0.5)`
* HSL:`hsl(120,65%,75%)`;色盘上的度数（从 0 到 360） - 0 (或 360) 是红色，120 是绿色，240 是蓝色。Saturation 是百分比值；0% 意味着灰色，而 100% 是全彩。Lightness 同样是百分比值；0% 是黑色，100% 是白色。
* HSLA颜色：`hsla(120,65%,75%,0.3)`:hsla(hue色调, saturation色饱和度, lightness亮度, alpha不透明度)
* 预定义/跨浏览器颜色名：green；red









