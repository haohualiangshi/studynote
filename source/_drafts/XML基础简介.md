---
title: XML基础简介与SVG
tags: xml,SVG
---

XML指可扩展标记语言；用来传输和存储数据；

## 树结构

XML文档形成一种树结构；它从"根部开始"，然后扩展到"树叶"；例如：

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<note>
<to>Tove</to>
<from>Jani</from>
<heading>Reminder</heading>
<body>Don't forget me this weekend!</body>
</note>
~~~

一个xml文件必须包含XML声明；根元素；所有XML元素都必须有一个关闭标签，区分大小写，并且正确嵌套；特殊意义的字符需要使用编码（实体引用）

### XML元素

元素是指从开始标签到结束标签的部分；元素可包括其他元素/文本或者两者的混合物；元素可以拥有属性；元素的命名规则：

* 名称可以包含字母/数字以及其他的字符
* 名称不能以数字或者标点符号开始
* 名称不能以字符"xml开始"
* 名称不能包含空格

#### XML属性

1. XML属性必须加引号；语法同html相同
2. 元数据（有关数据的数据）应当存储为属性，而数据本身应当存储为元素。

#### XML验证

xml语法规则：

1. 文档必须有根元素
2. 文档必须有关闭标签
3. 标签对大小写敏感
4. 元素必须正确的嵌套
5. 属性必须加引号

## SVG简介

SVG预定义的形状元素；

* 矩形`<rect></rect>`
* 圆形`<circle></circle>`
* 椭圆`<ellipse></ellipse>`
* 线`<line>`
* 折线`<polyline></polyline>`
* 多边形`<polygon></polygon>`
* 路径`<path></path>`

**矩形**

* 通过`x,y,height,width`属性定义位置和宽高；通过`style`定义样式

**圆形**

通过`<circle></circle>`标签创建圆形；cx,cy定义圆点x.y坐标；默认为0；r属性定义圆的半径

**椭圆**

通过`<ellipse></ellipse>`创建椭圆；cx属性定义圆点x坐标；cy属性定义圆点的y坐标；rx属性定义水平半径；ry属性定义垂直半径

**线条**

通过`<line></line>`标签定义创建线条；通过属性`x1/y1,x2/y2`定义线条在x轴和y轴的位置

**多边形**

通过`<polygon></polygon>`创建不少于三个边的图形；`points`属性定义多边形每个角的xy坐标

**折线**

通过`<polyline></polyline>`创建折线；`points`属性定义多个折线的起始点

**定义路径**

通过`<path></path>`标签定义路径；下边的命令可用于数据路径；

* M = move to
* L = line to
* H = horizontal line to
* V = vertical line to
* C = curve（曲线） to
* S = smooth（光滑） curve to
* Q = quadratic Belzier curve（贝塞尔曲线）
* T = smooth quadratic Belzier curve to
* A = elliptical Arc（椭圆形弧线）
* Z = close path

以上所有命令均允许小写字母；**大写表示绝对定位**；**小写表示相对定位**（相对于前一个坐标点）；

#### svg滤镜

滤镜用来向形状和文本添加特殊的效果，SVG元素可以使用多个滤镜；在SVG中，可用的滤镜有：

* feBlend
* feColorMatrix
* feComponentTransfer
* feComposite
* feConvolveMatrix
* feDiffuseLighting
* feDisplacementMap
* feFlood
* feGaussianBlur
* feImage
* feMerge
* feMorphology
* feOffset
* feSpecularLighting
* feTile
* feTurbulence
* feDistantLight
* fePointLight
* feSpotLight

**必须在`</defs></defs>`标签中定义SVG滤镜**

#### svg渐变

**渐变必须在`<defs></defs>`标签中进行定义**；渐变分为线性渐变和放射性渐变

**线性渐变**：使用`<linearGradient></linearGradient>`定义svg线性渐变；该标签必须定义在`<defs></defs>`内部；

~~~xml
<?xml version="1.0" standalone="no"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" 
"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">

<svg width="100%" height="100%" version="1.1"
xmlns="http://www.w3.org/2000/svg">

<defs>
<linearGradient id="orange_red" x1="0%" y1="0%" x2="100%" y2="0%">
<stop offset="0%" style="stop-color:rgb(255,255,0);
stop-opacity:1"/>
<stop offset="100%" style="stop-color:rgb(255,0,0);
stop-opacity:1"/>
</linearGradient>
</defs>

<ellipse cx="200" cy="190" rx="85" ry="55"
style="fill:url(#orange_red)"/>

</svg>
~~~

**代码解释：**

- `<linearGradient>` 标签的 id 属性可为渐变定义一个唯一的名称
- `fill:url(#orange_red) `属性把 ellipse 元素链接到此渐变
- `<linearGradient> `标签的 x1、x2、y1、y2 属性可定义渐变的开始和结束位置
- 渐变的颜色范围可由两种或多种颜色组成。每种颜色通过一个` <stop> `标签来规定。`offset `属性用来定义渐变的开始和结束位置。

**放射性渐变**：使用`<radialGradient></radialGradient>`标签定义在`<defs></defs>`内部

#### HTML页面中嵌入svg

1. 作为图片使用`<img/>`标签

   ~~~html
   <img src="mySvg" alt="">
   ~~~

2. 作为css背景

   ~~~
   .el {background-image: url(mySVG.svg);}
   ~~~

3. 作为对象用`<object>`标签

4. 使用`<iframe></iframe>`标签

5. 使用`<embed>`标签

6. 使用内联`<svg></svg>`标签

