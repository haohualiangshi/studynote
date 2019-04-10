---
title: flex总结
tags: flex
---

## Display:flex

### flex布局是什么

flex是flexible box的缩写；翻译成中文就是弹性盒子；可以设置`display:flex`行内元素也可以使用flex布局`display:inline-flex`;

### 基本概念

采用Flex布局的元素称为flex容器，简称`容器`；其所有子元素作为容器成员；简称`项目`

![img](/Users/macmini/Desktop/lifeSpace/studynote/source/_drafts/1679823-6ea441649bdf542a.png)

如上图所示：容器默认存在两根主轴；水平方向主轴和垂直交叉方向交叉轴；项目默认按主轴排列

### 容器属性

设置在容器上的属性有6种：

* flex-direction
* Flex-wrap
* Flex-flow
* Justify-content
* Align-item
* Align-content

**flex-direction属性：决定主轴的方向（即项目的排列方向）,属性值有四个：**

* row(默认)：水平排列；起点在左端
* row-reverse: 水平排列，起点在右端
* column: 主轴垂直方向；起点在上边沿
* column-reserve:主轴垂直方向；起点在下边沿

**flex-wrap属性：定义换行情况；属性值有四个**

* nowrap;不换行
* wrap：换行，第一行在上方；
* wrap-reverse：换行，第一行在下方。

**flex-flow属性是flex-direction和flex-wrap的简写；默认row nowrap**

**justify-content属性：定义项目在主轴上的对齐方式，属性值：**

* flex-start：左对齐；多余空间留右边
* flex-end：又对齐；多余空间留左边
* center：居中对齐；多余空间留两边
* space-between：两端对齐；项目之间的间隔都相等
* space-around：每个项目之间的间隔相等；所以项目之间的间隔比项目与边框的间隔大一倍

**align-items属性，定义项目在交叉轴上如何对齐，属性值：**

* flex-start：交叉轴顶部对齐；项目顶部对齐
* flex-end：交叉轴底部对齐；项目底部对齐
* center： 项目居中对齐
* stretch：拉伸对齐；项目自动拉伸成相等高度；顶部与底部对齐
* baseline：项目的基线对齐

**align-content属性；定义项目存在多根主轴线的情况下轴线的对齐方式。属性值：**

* Flex-start: 与交叉轴的起点对齐
* flex-end：与交叉轴的重点对齐
* center：与交叉轴的中点对齐
* stretch：轴线占满整个交叉轴；项目均等拉伸
* space-between：与交叉轴线的两端对齐；轴线之间的间隔平均分布
* space-around：每根轴线两侧的间隔都相等。所以，轴线之间的间隔比轴线与边框的间隔大一倍。

### 项目的属性

用在项目本身的属性有6个；分别是：

* order
* flex-grow
* flex-shrink
* flex-basis
* flex
* flign-self

**order属性定义项目的排列顺序；数值越小项目排列越靠前；默认是0**

**flex-grow属性定义项目的放大比例；默认是0**

**flex-shrink属性定义了项目的缩小比例；默认是1；数值越大在空间不足时压缩越大**

**flex-basis属性定义了在分配项目多余空间之前；项目占据的主轴空间；默认是auto容器打大小**

**flex属性；是flex-grow/flex-shrink/flex-basis的简写**

**align-self允许单个项目与其他项目不一样的对齐方式**

