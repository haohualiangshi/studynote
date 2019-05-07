---
title: 前端进阶之路-css3新增属性及使用
date: 2019-05-07 13:59:41
tags: 边框,阴影,background, transition,动画
---

#### 边框

在使用css2是我们能够使用`border`属性添加边框；但是要实现圆角效果是很棘手的；但使用CSS3新增的边框属性我们能够轻易实现这一效果；CSS3新增的边框属性：

* `border-radius`实现盒子的圆角
* `box-shadow`属性添加盒阴影
* `border-image`属性可以使用图像创建一个边框

#### border-radius

该属性是一个速记属性；用于设置盒子圆角的半径；

~~~css
border-radius: 1-4 length|% / 1-4 length|%;
~~~

**注意:** 每个半径的四个值的顺序是：左上角，右上角，右下角，左下角。如果省略左下角，右上角是相同的。如果省略右下角，左上角是相同的。如果省略右上角，左上角是相同的

~~~css
border-radius: 2em 1em 4em （水平半径）/ 0.5em 3em（垂直半径）;
//省略遵循规则如上；等价于
border-top-left-radius: 2em 0.5em;
border-top-right-radius: 1em 3em;
border-bottom-right-radius: 4em 0.5em;
border-bottom-left-radius: 1em 3em;
~~~

#### box-shadow

盒阴影可渲染外阴影盒内阴影效果，默认外阴影效果；

~~~css
box-shadow: X轴 Y轴 blur-radius spread-radius color inset
~~~

**属性值含义：**

X轴：指水平偏移量；其值可以是负值；如果是正值则阴影在对象的右边；负值则在左边

Y轴：指阴影垂直偏移量；可以是负值；正值在对象的底部，负值则在对象的顶部

blur-radius：阴影模糊半径；该参数可选；其值为0时表示阴影不具有模糊效果；其值越大阴影的边缘就越模糊

spread-radius：阴影扩展半径；该值可以是正负值；如果是正值；则整个阴影都延伸扩大；反之则缩小

color：此参数可选，如果不设定任何颜色时，浏览器会取默认色，但各浏览器默认色不一样，特别是在webkit内核下的safari和chrome浏览器将无色，也就是透明，建议不要省略此参数。

inset`属性值只有在设置内阴影效果时才使用；

#### Border-image

该属性是速记属性：是下列属性的集合

* Border-image-source:图像地址
* Border-image-slice：图像边界向内偏移
* Border-image-width：图像边界的宽度
* Border-image-outset：用于指定在边框外部绘制 border-image-area 的量
* Border-image-repeat：用于设置图像边界是否应重复（repeat）、拉伸（stretch）或铺满（round）。

#### background

该属性是一个速写属性；可拆分为：

* background-color
* background-image
* background-repeat
* background-position
* background-size
* background-origin
* background-clip
* background-attachment

**background-color**

**背景范围**

background-color 属性为元素设置一种纯色。这种颜色会填充元素的内容、内边距和边框区域，扩展到元素边框的外边界（但不包括外边距）。如果边框有透明部分（如虚线边框），会透过这些透明部分显示出背景色。

**background-image**:背景图

~~~
background-image:url('URL')
~~~

Background-repeat:设置是否及如何平铺背景图；默认背景图在水平和垂直方向重复；属性值：

* repeat:背景图将在垂直方向和水平方向重复
* repeat-x:背景图水平方向重复
* repeat-y：背景图垂直方向重复
* no-repeat：背景图将不平铺

**background-position**:设置背景图的起始位置

| 值                                                 |                                                              |
| :------------------------------------------------- | :----------------------------------------------------------- |
| top\|center\|bottom      &nbsp;left\|center\|right | 如果您仅规定了一个关键词，那么第二个值将是"center"。默认值：0% 0%。 |
| x% y%                                              | 第一个值是水平位置，第二个值是垂直位置。左上角是 0% 0%。右下角是 100% 100%。如果您仅规定了一个值，另一个值将是 50%。 |
| xpos ypos                                          | 第一个值是水平位置，第二个值是垂直位置。左上角是 0 0。单位是像素 (0px 0px) 或任何其他的 CSS 单位。如果您仅规定了一个值，另一个值将是50%。您可以混合使用 % 和 position 值。 |

**background-size**:设置背景图的尺寸

| 值           | 描述                                                         |
| :----------- | :----------------------------------------------------------- |
| *length*     | 设置背景图像的高度和宽度。第一个值设置宽度，第二个值设置高度。如果只设置一个值，则第二个值会被设置为 "auto"。 |
| *percentage* | 以父元素的百分比来设置背景图像的宽度和高度。第一个值设置宽度，第二个值设置高度。如果只设置一个值，则第二个值会被设置为 "auto"。 |
| cover        | 把背景图像扩展至足够大，以使背景图像完全覆盖背景区域。背景图像的某些部分也许无法显示在背景定位区域中。 |
| contain      | 把图像图像扩展至最大尺寸，以使其宽度和高度完全适应内容区域。 |

**background-origin**：定位背景图位置

| 值          | 描述                           |
| :---------- | :----------------------------- |
| padding-box | 背景图像相对于内边距框来定位。 |
| border-box  | 背景图像相对于边框盒来定位。   |
| content-box | 背景图像相对于内容框来定位。   |

**background-clip**：规定背景的现实位置

| 值          | 描述                   |
| :---------- | :--------------------- |
| border-box  | 背景被裁剪到边框盒。   |
| padding-box | 背景被裁剪到内边距框。 |
| content-box | 背景被裁剪到内容框。   |

**background-attachment**：设置背景图像是否固定或者随着页面的其余部分滚动

| 值      |                          描述                           |
| :------ | :-----------------------------------------------------: |
| scroll  |    默认值。背景图像会随着页面其余部分的滚动而移动。     |
| fixed   |       当页面的其余部分滚动时，背景图像不会移动。        |
| inherit | 规定应该从父元素继承 background-attachment 属性的设置。 |

#### transition

该属性是一个速写属性：用于设置四个过渡属性

* transition-property:设置过渡效果的css属性的名称
* transition-duration：设置过渡效果需要多少秒或毫秒
* transition-timing-function：规定速度效果的速度取消；属性值
  * linear:规定以相同速度从开始至结束的过渡效果
  * ease:规定慢速开始/然后变快/最后慢速结束的过渡效果
  * ease-in：规定以慢速开始的过渡效果
  * ease-out：规定以慢速结束的过渡效果
  * ease-in-out：规定以慢速开始和结束的过渡效果
  * cubic-bezier(n,n,n,n):在cubic-bezier函数中定义自己的值；可能的值时0至1之间的数值
* transition-delay：过渡效果延迟时间

#### 动画

animation属性是一个简写属性；用于设置6个动画属性

* @keyframes:定义动画
* animation-name：绑定`@keyframes`定义的动画名称
* animation-duration：规定动画所花费的时间
* animation-timing-function：规定动画的速度曲线
* animation-delay：规定动画的延时
* animation-iteration-count：规定动画的播放次数
* animation-direction：规定是否应该轮流反向播放动画
* animation-play-state：规定动画是否正在运行或暂停
* animation-fill-mode：规定对象动画之外的状态

**animation-fill-mode**：规定动画在播放之前或之后；其动画效果是否可见

| none      | 不改变默认行为。                                             |
| --------- | ------------------------------------------------------------ |
| forwards  | 当动画完成后，保持最后一个属性值（在最后一个关键帧中定义）。 |
| backwards | 在 animation-delay 所指定的一段时间内，在动画显示之前，应用开始属性值（在第一个关键帧中定义）。 |
| both      | 向前和向后填充模式都被应用。                                 |

