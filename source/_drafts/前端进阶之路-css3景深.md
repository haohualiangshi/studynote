---
title: 前端进阶之路-css3景深
tags: 3D基础之景深,transform-style,backface-visibility
---

#### 3D视角

参看下边的3D坐标轴
![avatar](https://img-blog.csdnimg.cn/20190413110136915.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2gxMjM0NTYxMjM0NTYx,size_16,color_FFFFFF,t_70)

1. X轴从左到右，Y轴从上到下，Z周从里到外；视角处于Z轴正方向圆锥尖点方向；正值方向为顺时针；原始的X，Y，Z轴的中心点为元素的中心点【也叫做元素的**基点**（可以利用`transform-origin`自行更改）】
2. `perspective`【景深】就是Z轴原始定位；提供了一个空间距离的参照物；可正负值

#### 景深简介/作用/视觉效果

