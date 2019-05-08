---
title: 前端进阶之路-css3景深
tags: transform,3D基础之景深,transform-style,backface-visibility
---

在了解景深之前我们必须了解css属性`transform`;该属性允许我们对元素进行旋转/缩放/移动/倾斜。

对元素设置旋转效果时避免不了要考虑基点`transform-origin`;该属性能够改变被转换元素的做属性操作时依赖的相对点；默认值`50% 50% 0`;

语法：`transform-origin: x-axis y-axis z-axis;`

| 值     | 描述                                                         |
| :----- | :----------------------------------------------------------- |
| x-axis | 定义视图被置于 X 轴的何处。可能的值：leftcenterright*length**%* |
| y-axis | 定义视图被置于 Y 轴的何处。可能的值：topcenterbottom*length**%* |
| z-axis | 定义视图被置于 Z 轴的何处。可能的值：*length*                |

语法：`transform: none|transform-functions;`

| 值                                                           | 描述                                    |
| :----------------------------------------------------------- | :-------------------------------------- |
| none                                                         | 定义不进行转换。                        |
| matrix(*n*,*n*,*n*,*n*,*n*,*n*)                              | 定义 2D 转换，使用六个值的矩阵。        |
| matrix3d(*n*,*n*,*n*,*n*,*n*,*n*,*n*,*n*,*n*,*n*,*n*,*n*,*n*,*n*,*n*,*n*) | 定义 3D 转换，使用 16 个值的 4x4 矩阵。 |
| translate(*x*,*y*)                                           | 定义 2D 转换。                          |
| translate3d(*x*,*y*,*z*)                                     | 定义 3D 转换。                          |
| translateX(*x*)                                              | 定义转换，只是用 X 轴的值。             |
| translateY(*y*)                                              | 定义转换，只是用 Y 轴的值。             |
| translateZ(*z*)                                              | 定义 3D 转换，只是用 Z 轴的值。         |
| scale(*x*,*y*)                                               | 定义 2D 缩放转换。                      |
| scale3d(*x*,*y*,*z*)                                         | 定义 3D 缩放转换。                      |
| scaleX(*x*)                                                  | 通过设置 X 轴的值来定义缩放转换。       |
| scaleY(*y*)                                                  | 通过设置 Y 轴的值来定义缩放转换。       |
| scaleZ(*z*)                                                  | 通过设置 Z 轴的值来定义 3D 缩放转换。   |
| rotate(*angle*)                                              | 定义 2D 旋转，在参数中规定角度。        |
| rotate3d(*x*,*y*,*z*,*angle*)                                | 定义 3D 旋转。                          |
| rotateX(*angle*)                                             | 定义沿着 X 轴的 3D 旋转。               |
| rotateY(*angle*)                                             | 定义沿着 Y 轴的 3D 旋转。               |
| rotateZ(*angle*)                                             | 定义沿着 Z 轴的 3D 旋转。               |
| skew(*x-angle*,*y-angle*)                                    | 定义沿着 X 和 Y 轴的 2D 倾斜转换。      |
| skewX(*angle*)                                               | 定义沿着 X 轴的 2D 倾斜转换。           |
| skewY(*angle*)                                               | 定义沿着 Y 轴的 2D 倾斜转换。           |
| perspective(*n*)                                             | 为 3D 转换元素定义透视视图。            |

**平移**:transform: translate(40px,60px)；本身在文档流中的占位不变；类似于相对定位中的`top/left`属性

**旋转：**`transform:rotate(30deg)`通过指定的角度参数对元素设定2D旋转；需要有`transform-origin`属性的定义。`transform-origin`定义的是旋转的基点；角度值设置正数顺时针；负值逆时针旋转；

**缩放：**`transform:scaleX(x,y)`使元素水平方向与垂直方向同时缩放；缩放值基数为1.如果其值大于1元素就放大；反之小于1；元素缩小；

**扭曲：**`transform:skew(30deg,80deg)`该属性用来对元素进行扭曲变形；第一个角度时水平方向扭曲度；第二个参数时垂直方向扭曲度；第二个参数可续；默认为0;难理解的参考该网址[CSS3 skew变化原理](http://blog.sina.com.cn/s/blog_610883950102wffx.html)；[skew图文详解](https://www.jb51.net/css/193472.html)

**注意：**扭曲度数y轴顺时针问正；x轴逆时针为正；设置x轴扭曲高度不变；宽度拉伸；设置y轴扭曲；宽度不变高度拉伸；

**矩阵：**`transform:matrix(0.866,0.5,-0.6,0.866,0,0)`使用一个含六个值的变换矩阵的形式指定一个2D变换；项目中未用到过；以后有机会使用着重介绍

#### 3D视角

参看下边的3D坐标轴
![avatar](https://img-blog.csdnimg.cn/20190413110136915.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2gxMjM0NTYxMjM0NTYx,size_16,color_FFFFFF,t_70)

1. X轴从左到右，Y轴从上到下，Z周从里到外；视角处于Z轴正方向圆锥尖点方向；正值方向为顺时针；原始的X，Y，Z轴的中心点为元素的中心点【也叫做元素的**基点**（可以利用`transform-origin`自行更改）】
2. `perspective`【景深】就是Z轴原始定位；提供了一个空间距离的参照物；可正负值

#### 景深简介/作用/视觉效果

**景深**：让3D场景有近大远小的感觉（我们肉眼距离屏幕的距离）；应用景深的元素称为"舞台元素"注意点：

* 元素在轴上的移动就是改变我们肉眼距离屏幕的距离，从而产生一种视觉效果；元素离我们远了或者近了
* `perspective`是一个不可继承的属性；舞台元素的所有后代元素都会收到影响；如果后代元素也添加了perspective属性；效果会叠加而不是覆盖
* `transform:perspective`只可以作用于元素本身；且必须放在`transform`变化样式首位

#### 使用景深进行3D旋转，平移，缩放

**旋转**

* 单值旋转`rotateX(xdeg)`:以X轴为旋转轴；角度为X度；顺时针方向为正；逆时针反之。
* 组合旋转：`rotate3d(x,y,z,angle)`沿着元素中心点(x,y,z)所构成的射线进行角度为angle数值度旋转

**平移**

* 单值平移：如`translateX(100%)`以X轴为平移轴；平移距离为元素本身的`width正值顺时针旋转；负值逆时针旋转
* 组合平移：`translate3d(100px, 100px, 100px)`以元素中心移动到点（100,100,100)的位置

#### 灭点

灭点指的是立体图形个条边的延伸线所产生的相交点:如下图；

![avator](https://img-blog.csdnimg.cn/2019041311543440.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2gxMjM0NTYxMjM0NTYx,size_16,color_FFFFFF,t_70)

**注意点**：景深越大，灭点越远，元素变形更小；景深越小，灭点越近，元素变形更大

#### 视觉层级效果

使用`transform-style`营造视觉层级舞台效果：两个属性值：

* `flat`默认，表示所有子元素在2D平面呈现
* `preserve-3D`表示所有子元素在3D平面呈现

**注意：**

* `transform-style`是一个不可继承的属性；但是可以作用于子代【注意不是后代】子元素
* 对于设置了`overflow:hidden`的元素；设置的3D效果会消失
* 舞台上的各个元素；除了遵守Dom层次级别外；实际上在Z轴的原始位置都是相同的

#### 背面可见属性

`backface-visibility`属性可以指定当前元素背对我们是否可见；两个属性值：

* `visibility`默认值
* `hidden`不可见

