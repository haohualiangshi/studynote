---
title: vuetify_01
tags: [vuetify]
---

最近接手了个项目是用vuetify组件写的；鉴于水的一笔的英文水平；有道着api文档；这里做下学习总结；

### Colors

1. 块的背景色可以直接使用定义好的颜色类名；例如`class="red"`等同于`background-color:red`;也可以添加类名`{lighten | darken}-n`更改颜色亮度；其中n的值是[1-5]；数值越大表示亮度或者暗度越大

2. 文本颜色可以直接使用定义好的类名；例如`class="text--red"`等同于`color:red`;也可以添加类名`text--{lighten|darken}-n`来辅助表示定义颜色的亮度或暗度；n的范围是[1-5]

3. 在使用vuetify引入时；我们可以预先定义一些常用的颜色

   ~~~js
   // src/plugins/vuetify.js
   
   import Vue from 'vue'
   import Vuetify from 'vuetify/lib'
   
   import colors from 'vuetify/lib/util/colors'
   
   Vue.use(Vuetify)
   
   export default new Vuetify({
     theme: {
       themes: {
         light: {
           primary: colors.red.darken1, // #E53935
           secondary: colors.red.lighten4, // #FFCDD2
           accent: colors.indigo.base, // #3F51B5
         },
       },
     },
   })
   ~~~

   

### elevation 拔高

通过类名`elevation-n`来改变阴影层次颜色；视觉上生成拔高的感觉；n的范围是[0-24]

### display

显示助手允许您控制内容的显示。这包括基于当前视口或实际元素显示类型有条件地可见;定义的属性有`xs(<600px),sm(<960px),md(<1264px),lg(<1904px),xl(>1904px)`

通过类名`d-{value}`用于默认制定xs格式下的display属性；`d-flex`等同于`display:flex;`

也可以通过设置类名`d-{breakpoint}-{value}`来设置不同屏幕下的展示方式；

breakpoint就是上边所说的xs

value的取值有：

* none
* inline
* Inlin-block
* block
* table
* flex
* Inline-flex
* table-cell
* table-row

### float

使用的类名格式

`float-{left\right}`或者`float-{breakpoint}-{left\right}`

### spacing

类名格式：`{property}{direction}-{size}`

property的取值：

1. `m`表示`margin`
2. `p`表示`padding`

direction的取值

* `t`- `top`
* `b`-`bottom`
* `l`-`left`
* `r`-`right`
* `s`-`margin-left/padding-left`在LTR模式下；在RLT模式下表示`margin-right/padding-right`
* `e`-在LTR模式下表示`margin-right/margin-right`;在RTL模式下表示`margin-left/padding-left`
* `x`-`{m}-left;{m}-right`
* `y`-`{m}-top;{m}-bottom`
* `a`-`margin`或者`padding`

size的取值[0-12]或者[n1-n24]表示负值

没一个数字表示4px

例如：'.ma-3'表示为`margin:12px`

也可以在这个规则里使用断点；使用规则是`{property}{direction}-{breakpoint}-{size}`

### text

可以使用定义好的类名规则实现文本对齐效果`text-{property}`

~~~css
.text-capitalize {
  text-transform: capitalize !important;
}
.text-lowercase {
  text-transform: lowercase !important;
}
.text-none {
  text-transform: none !important;
}
.text-uppercase {
  text-transform: uppercase !important;
}
.text-no-wrap {
  white-space: nowrap !important;
}
.text-truncate {
  white-space: nowrap !important;
  overflow: hidden !important;
  text-overflow: ellipsis !important;
  line-height: 1.1 !important;
}
~~~

### 组件

Note:关于组件上的属性；官网默认是false个人猜测是只不添加该属性的时候；添加该属性后默认设置该属性为true；因此在下边的api中方便记忆我改成了true；布尔值省略的默认为true

### v-app

在vuetify中；`v-app`组件和一些适用于属性的组件如`v-navigation-drawer/v-app-bar/v-footer`和其他组件；帮助你的应用在使用组件`v-content`获得适当的尺寸；这使您可以创建真正独特的界面，而无需管理布局大小；`v-app`组件在你的应用中是必要的；这是许多Vuetify组件和功能的安装点，并确保这一点；它将默认应用程序*variant* (**dark/light**)传播到子组件，并确保在Safari等浏览器中对某些点击事件进行适当的跨浏览器支持，确保在一个页面中（包含路由的页面）中仅使用一次；

#### prop

| name |  type  | default |
| :--: | :----: | ------- |
|  Id  | String | 'app'   |

Note:必须确保所有的组件的顶级父元素是`v-app`组件；

使用`app`属性会自动添加`position:fixed`到该元素上；使用vue-router时，建议您将视图放在v-content中；应用app 属性会自动应用position：fixed到layout元素。如果应用程序要求使用绝对元素，则可以使用position prop来覆盖此功能

下面是所有支持`app`属性的组件列表，这些组件可以用作应用程序中的布局元素。这些组件可以混合和匹配，并且任何时候都只能存在一个特定的组件。但是，您可以将它们交换出来，这样布局就可以适应了；这些组件在布局系统中都有特定的位置和优先级

* `v-system-bar`:始终位于应用程序的顶部且优先级高于`v-app-bar`
* `v-app-bar`:始终位于应用程序的顶部，其优先级低于v-system-bar
* `v-navigation-drawer`:可以放置在应用程序的左侧或右侧用于功能列表；可以配置位置在`v-app-bar`的旁边（左右侧边栏）或者下边
* `v-footer`:始终位于应用程序的底部，其优先级低于v-bottom-navigation
* `v-bottom-navigation`:总是放在应用程序的底部，优先级高于v-footer

简而言之，v-system-bar始终位于v-app-bar之上，v-navigation-drawer可以占据左侧或右侧，而V-footer始终位于v-bottom-navigation的顶部;

应用程序服务用于配置Vuetify布局。它与v-content组件通信，以便能够正确调整应用程序内容的大小。它有许多可以访问的属性

~~~js
{
  bar: number
  bottom: number
  footer: number
  footerInset: number
  left: number
  right: number
  top: number
}
~~~

使用app prop添加和删除组件时，这些值会自动更新。它们不可编辑且存在于READONLY状态。您可以通过引用$ vuetify对象上的application属性来访问这些值

`console.log(this.$vuetify.application.top) // 56`

### v-system-bar

`v-system-bar`组件可以用于显示用户状态；类似于安卓系统的状态栏

#### props

|    属性名    | 值的类型       | 默认值    |                           属性描述                           |
| :----------: | -------------- | --------- | :----------------------------------------------------------: |
|   absolute   | Boolean        | True      |    设置该属性为true后默认在组件上添加`position:absolute`     |
|     App      | Boolean        | true      | 将组件指定为应用的一部分；用于动态调整内容的大小；使用该属性的组件不应该放在`v-content`组件中 |
|    color     | String         | undefined |            将制定的颜色用于组件；相当于设置背景色            |
|     dark     | false          | True      |                添加该主题后默认添加暗色背景色                |
|    Fixed     | Boolean        | True      |        添加`position:fixed`属性到组件；等同于app属性         |
|    height    | number\|String | undefined |                        为组件设置高度                        |
|    light     | Boolean        | true      |                      为组件设置亮色主题                      |
| `lights-out` | Boolean        | True      | 设置背景色为的不透明度；亮色主题为`background-color: hsla(0,0%,100%,.7)!important`;暗色主题为`background-color: rgba(0,0,0,.2)!important` |
|   `window`   | Boolean        | True      |           设置`system-bar`的高度为32px；默认是24px           |

### v-app-bar

`v-app-bar`组件用于向应用提供一些信息和通用型功能操作；如果在`v-toolbar`和`v-app-bar`中使用带icon的`v-btn`组件；它们将自动增加尺寸并应用负边距以确保适当的间距

#### props

| 属性名             | 值类型         | 默认值    | 属性描述                                                     |
| ------------------ | -------------- | --------- | ------------------------------------------------------------ |
| `absolute`         | Boolean        | true      | 设置`position:absolute`到该组件                              |
| `app`              | Boolean        | true      | 设置`position:fixed`到该组件                                 |
| bottom             | Boolean        | True      | 在移动设备上自动将`v-app-bar`移动到底部                      |
| clipped-left       | Boolean        | true      | 配合`v-navigation-draw`使用；让侧边栏在左边                  |
| clipped-right      | 同上           |           | 让侧边栏位于屏幕右边                                         |
| collapse           | boolean        | true      | 将工具栏`v-toolbar`置于收缩状态;减少最大宽度                 |
| collapse-on-scroll | Boolean        | true      | 滚动时将`v-app-bar`置于折叠状态                              |
| color              | string         |           |                                                              |
| dark               | string         |           |                                                              |
| dense              | boolean        |           | 将`v-app-bar`的高度设定为48px；默认是64px；配合prominent属性时是96px |
| elevate-on-scroll  | boolean        |           | 滚动时给`v-app-bar`设定阴影                                  |
| elevation          | number\|string | undefined | 给`v-app-bar`设定阴影；数字参照类名`.elevation-{n}`          |
| extended           | boolean        |           | 使用此属性可以增加工具栏的高度；相当于增加了一个`v-toolbar`;而无需使用扩展槽来添加内容;也可以使用extension-height属性或者dense/prominent属性来设置高度 |
| Extension-height   | num\|str       |           | 为extended指定一个明确的高度                                 |
| fade-img-on-scroll | boolean        |           | 滚动时给背景img标签添加褪色效果                              |
| fixed              | boolean        |           | 添加`position:fixed`属性                                     |
| flat               | boolean        |           | 移除toolbar的阴影效果                                        |
| floating           | boolean        |           | 给组件设置`display:inline-flex`                              |
| height             | num\|str       |           | 设置高度                                                     |
| hide-on-scroll     | boolean        |           | 滚动时隐藏`v-app-bar`；但不隐藏通过`extension`生成的         |
| inverted-scroll    | boolean        |           | 控制`v-app-bar在滚动时显示和隐藏；滚动到顶部隐藏             |
| light              | Boolean        |           |                                                              |
| max-height         | Num\string     |           |                                                              |
| max-width          | Num\string     |           |                                                              |
| min-height         | Num\string     |           |                                                              |
| `min-width`        | Num\string     |           |                                                              |
| prominent          | boolean        |           | 设置`v-app-bar`的高度为128px                                 |
| scroll-off-screen  | boolean        |           | 滚动时隐藏`v-app-bar`。不会显示扩展槽(测试未起作用；原因不明) |
| scroll-target      | string         |           | 指定滚动事件的目标元素；默认是window滚动                     |
| scroll-threshold   | Num\string     |           | 设置触发**hide-on-scroll**属性的滚动阈值                     |
| short              | boolean        |           | 将`v-app-bar`的高度设定为56px                                |
| shrink-on-scroll   | boolean        |           | 在有prominent属性的v-app-bar上；当滚动后的最小高度是short属性的高度；当有dense属性是滚动后的最小高度是dense属性的高度 |
| src                | string\object  |           | 指定一个v-img组件为背景图                                    |
| tag                | string         | ‘header’  | 指定一个标签为根元素                                         |
| titl               | boolean        |           | 移除组件上的`border-radius`属性                              |
| value              | boolean        |           | 控制组件的显示与隐藏                                         |
| width              |                |           |                                                              |

#### slots

| 插槽名    | 插槽描述                                                     |
| --------- | ------------------------------------------------------------ |
| default   |                                                              |
| extension | 插槽直接位于工具栏的主要内容下方；可以使用`extension-height `属性明确设置此插槽的高度；如果该插槽没有内容则可以使用`extended`属性代替 |
| img       | 用于`v-img`组件；作用与插槽属性需要使用`v-bind`绑定；`v-bind="props"` |





### v-navigation-bar

`v-navigation-bar`是通过导航栏向用户展示应用程序；收容页面的链接；在初始化的使用给`v-model`设置`null`能够默认在移动端默认收起在pc端打开；

#### props

| 属性名                 | 属性值类型      | 属性默认值        | 属性描述                                                     |
| ---------------------- | --------------- | ----------------- | ------------------------------------------------------------ |
| absolute               | boolean         |                   |                                                              |
| app                    | boolean         |                   |                                                              |
| bottom                 | boolean         |                   | 在移动设备下导航从屏幕底部扩展                               |
| clipped                | boolean         |                   | 隐藏`v-navigation-bar到v-toolbar`下边                        |
| color                  | string          |                   |                                                              |
| dark                   | boolean         |                   |                                                              |
| disable-resize-watcher | boolean         |                   | 当调整视窗的大小时会自动打开或关闭`v-navigation-bar`         |
| disable-route-watcher  | boolean         |                   | 路由改变时不打开`v-navitation-bar`                           |
| expand-on-hover        | boolean         |                   | 配合`mini-variant`设置`v-navigation-bar`在hover的时候展开    |
| fixed                  | boolean         |                   |                                                              |
| floating               | boolean         |                   | 移除`v-navigation-drawer`的边线效果                          |
| height                 | number\|string  |                   |                                                              |
| hide-overlay           | boolean         |                   | 隐藏叠加层的显示;同`temporary`功能相反                       |
| light                  | boolean         |                   |                                                              |
| mini-variant           | boolean         |                   | 收缩侧边栏的宽度；可以添加`.sync`属性；添加属性后用户点击侧边栏重新打开 |
| mini-variant-width     | number\|string  | 80                | 设置`mini-variant`属性后；侧边栏收缩后的默认宽度             |
| mobile-break-point     | number\|string  | 1264              | 为组件设定指定的移动端断点；为移动端提供一个备用的样式       |
| permanent              | boolean         |                   | 无论屏幕的大小都显示`v-navigation-drawer`                    |
| right                  | boolean         |                   | 侧边导航栏位于右边                                           |
| src                    | `string|object` |                   | 设置一个背景图                                               |
| stateless              | boolean         |                   | 移除所有的自动状态功能(`resize/mobile/route`)和手动控制的一些状态； |
| tag                    | string          | `<aside></aside>` |                                                              |
| temporary              | boolean         |                   | `v-navigation-drawer`展开后是否展示黑色透明背景覆盖到屏幕上  |
| touchless              | boolean         |                   | 禁用移动端的touch事件                                        |
| value                  | any             | undefined         | 控制组件显示与隐藏                                           |
| width                  | number\|string  | 256               |                                                              |

#### slots：内部定义的插槽

| 插槽名    | 插槽描述                               |
| --------- | -------------------------------------- |
| `append`  | 在`v-navigation-drawer`引用一个插槽    |
| `default` | 默认的vue插槽                          |
| `img`     | 当使用`src`属性时用于修改`v-img`的属性 |
| `prepend` | 定一个插槽用于放到侧边导航栏的顶部     |

#### Events

| 事件名              | 事件描述                | Value   |
| ------------------- | ----------------------- | ------- |
| `input`             | 更新绑定的事件模型      | boolean |
| `transitionend`     | 转换完成后发出事件对象  | object  |
| update:mini-variant | `mini-variant.sync`事件 | boolean |





### v-bottom-navigation

`v-bottom-navigation`是侧边栏的一种替代；主要用于移动端的

props

| 属性名           | 属性值类型      | 属性默认值      | 属性描述                                                     |
| ---------------- | --------------- | --------------- | ------------------------------------------------------------ |
| absolute         | boolean         |                 |                                                              |
| active-class     | string          | `v-btn--active` | 用于选定导航按钮的类名                                       |
| app              | boolean         |                 |                                                              |
| background-color | string          |                 | 改变组件的背景色                                             |
| color            | string          |                 |                                                              |
| dark             | boolean         |                 |                                                              |
| fixed            | boolean         |                 |                                                              |
| grow             | boolean         |                 | 使`v-btns`占用所有可用空间                                   |
| height           | number\|string  |                 |                                                              |
| hide-on-scroll   | boolean         |                 |                                                              |
| horizontal       | boolean         |                 | 是导航按钮水平排列                                           |
| input-value      | boolean         |                 | 等同于上边组件的`value`属性；控制组件的显示与隐藏；支持`.sync`修饰符 |
| light            | boolean         |                 |                                                              |
| mandatory        | boolean         |                 | 强制始终选择值（如果可用）                                   |
| max-height       | `number|string` |                 |                                                              |
| max-width        | number\|string  |                 |                                                              |
| min-height       |                 |                 |                                                              |
| min-width        |                 |                 |                                                              |
| scroll-target    | string          | window          |                                                              |
| scroll-threshold |                 |                 |                                                              |
| shift            | boolean         |                 | 处于未触发状态隐藏文案；触发后显示文案                       |
| value            |                 |                 | 保持当前活动的v-btn的值。如果按钮没有提供值，则将使用其索引  |
| width            |                 |                 |                                                              |

event

| 事件名             | 事件描述                                                    | 值              |
| ------------------ | ----------------------------------------------------------- | --------------- |
| change             | 当前所选按钮的值。如果没有值是assigne，则将是按钮的当前索引 | any             |
| update:input-value | 该事件用于input-value.sync                                  | string\| number |



### v-footer

v-footer组件用于显示用户可能希望从站点中的任何页面访问的常规信息

props

| 属性名     | 属性值类型     | 属性描述 | 属性描述                                      |
| ---------- | -------------- | :------- | --------------------------------------------- |
| app        | boolean        |          |                                               |
| color      | boolean        |          |                                               |
| absolute   | boolean        |          |                                               |
| dark       | boolean        |          |                                               |
| elevation  | number\|string |          |                                               |
| fixed      | boolean        |          |                                               |
| height     | number\|string |          |                                               |
| inset      | boolean        |          | 将工具栏从应用程序v-navigation-drawer定位偏移 |
| light      | boolean        |          |                                               |
| max-height | number\|string |          |                                               |
| max-width  | number\|string |          |                                               |
| min-height | number\|string |          |                                               |
| min-width  | number\|string |          |                                               |
| padless    | boolean        |          | 移除footer的padding值                         |
| tag        | string         |          |                                               |
| tile       | boolean        |          | 移除组件的`border-radius`                     |
| width      | number\|string |          |                                               |



### v-alerts

v-alert组件用于通过使用上下文类型图标和颜色向用户传达重要信息。这些默认类型有4种变体：成功(success)，信息(info)，警告(warning)和错误(error)。

props

| 属性名         | 属性值类型      | 属性默认值       | 属性描述                                               |
| -------------- | --------------- | ---------------- | ------------------------------------------------------ |
| border         | string          | undefined        | 在`v-alert`设置边框；                                  |
| close-label    | string          | `$vuetify.close` |                                                        |
| color          | string          |                  |                                                        |
| colored-border | boolean         |                  | 将定义的颜色应用于警报的边框                           |
| dark           |                 |                  |                                                        |
| dense          | boolean         |                  | 隐藏警报图标并降低组件的高度                           |
| dismissible    | boolean         |                  | 添加可隐藏警报的关闭图标                               |
| height         | number \|string |                  |                                                        |
| icon           | boolean\|string | undefined        | 指定特定图标                                           |
| elevation      |                 |                  |                                                        |
| light          | boolean         |                  |                                                        |
| max-height     |                 |                  |                                                        |
| max-width      |                 |                  |                                                        |
| min-height     |                 |                  |                                                        |
| min-width      |                 |                  |                                                        |
| mode           | string          |                  | 设置过渡模式                                           |
| origin         | string          |                  | 设置元素的过渡原点                                     |
| outlined       | boolean         |                  | 应用透明背景并添加细边框                               |
| prominent      | boolean         |                  | 显示较大的垂直居中图标以吸引更多注意力                 |
| tag            | string          |                  |                                                        |
| text           | boolean         |                  | 将定义的颜色应用于文本，并将低不透明度背景应用于文本   |
| tile           | boolean         |                  | 移除组件的`border-radius`效果                          |
| transition     | string          |                  | 设置组件的过渡效果                                     |
| type           | string          |                  | 使用与定义好样式的`v-alert`;success/info/warning/error |
| value          | boolean         |                  | 控制组件的显示与隐藏                                   |
| width          | number\|string  |                  |                                                        |



slots

| 插槽名  | 插槽描述                           | 插槽属性                 |
| ------- | ---------------------------------- | ------------------------ |
| append  | 定义一个插槽在在提示框末尾添加图标 |                          |
| close   | 定义一个图标用于`dismissible`属性  | `{   toggle: Function }` |
| prepend | 定义一个插槽用于alert弹框的开头    |                          |



#### input

| 事件名 | 事件描述       | 事件值  |
| ------ | -------------- | ------- |
| input  | 更新绑定的模型 | boolean |

#### Functions

toggle：`():void`





### v-responsive

`v-responsive`属性允许设定一个固定的展示比例

#### props

| 属性名       | 属性值类型     | 属性默认值 | 属性描述                                                     |
| ------------ | -------------- | ---------- | ------------------------------------------------------------ |
| aspect-ratio | string\|number | undefined  | 设置基本宽高比，以宽度/高度计算。这只会设置一个最小高度，如果组件内容很多，组件仍然可以增长 |
| height       |                |            |                                                              |
| max-height   |                |            |                                                              |
| max-width    |                |            |                                                              |
| min-height   |                |            |                                                              |
| width        |                |            |                                                              |



### v-avatar

`v-avatars`组件一般用于用户的原型头像展示；该组件允许开发者动态的调整大小；添加圆角/图片/icons/和文本；使用`tile`属性可以设置去除该组件的圆角效果

| 属性名     | 属性值类型     | 属性默认值 | 属性描述               |
| ---------- | -------------- | ---------- | ---------------------- |
| color      | string         | undefined  | 将指定的颜色应用于控件 |
| height     | number\|string | undefined  |                        |
| left       | boolean        | false      | 指定头像位于组件的左侧 |
| max-height |                |            |                        |
| max-width  |                |            |                        |
| min-height |                |            |                        |
| min-width  |                |            |                        |
| right      |                |            |                        |
| size       |                |            |                        |
| tile       |                |            | 去除border-radius效果  |
| width      |                |            |                        |



### badge

v-badge组件将类似头像的图标或文本上标或下标到内容上以向用户突出显示信息或仅引起对特定元素的注意;徽章中的内容通常包含数字或图标。

#### props

| 属性名     | 属性值描述 | 属性默认值       | 属性描述                           |
| ---------- | ---------- | ---------------- | ---------------------------------- |
| bottom     | boolean    |                  | 将组件对齐底部                     |
| color      | string     |                  |                                    |
| left       | boolean    |                  | 将组件向左对齐                     |
| mode       | boolean    |                  | 设置过渡模式                       |
| origin     | string     |                  |                                    |
| overlap    | boolean    |                  | 将插槽的内容覆盖组件的顶角或者底角 |
| transition | string     | ‘fab-transition’ | 设置组件的过渡效果                 |
| value      | any        | true             |                                    |



#### slots

| 插槽名 | 插槽描述                 |
| ------ | ------------------------ |
| badge  | 该组件用于徽章的显示内容 |



### v-banner

v-banner组件用作具有1-2个动作的用户的中间中断消息。它有两种变体，单线和多线（隐式）。这些图标可以与您的消息和操作一起使用

#### props

| 属性名             | 属性值类型     | 属性默认值 | 属性描述                                           |
| ------------------ | -------------- | ---------- | -------------------------------------------------- |
| color              | string         | undefined  |                                                    |
| dark               |                |            |                                                    |
| elevation          | Num \| str     |            |                                                    |
| height             | number\|string |            |                                                    |
| icon               | string         | undefined  | 指定特定图标                                       |
| icon-color         | string         | undefined  | 指定特定的图标颜色                                 |
| light              | boolean        |            |                                                    |
| max-height         |                |            |                                                    |
| max-width          |                |            |                                                    |
| min-height         |                |            |                                                    |
| min-width          |                |            |                                                    |
| mobile-break-point | number\|string | 960        | 设置组件的指定移动断点。这将为移动设备应用其他样式 |
| single-line        | boolean        |            | 将横幅强制放在一行上                               |
| sticky             | boolean        |            | 将position：sticky应用于组件                       |
| tag                | string         | div        |                                                    |
| tile               | boolean        |            | 移除`border-radius`效果                            |
| value              | boolean        |            | 控制组件是可见还是隐藏                             |
| width              |                |            |                                                    |

#### slots

| 插槽名  | 插槽描述                                                     |
| ------- | ------------------------------------------------------------ |
| actions | 用于动作内容的插槽，例如v-btn。调用此插槽范围中的解除功能将关闭横幅 |
| icon    | 用于图标内容的插槽。                                         |

#### function

`toggle`





### v-toolbar

`v-toolbar`组件是对于用户界面是关键的部分；通常用于设置用户的导航；该组件通常与`v-navigation-drawer`组件和`v-card`组件；

工具栏是一个灵活的容器，可以通过多种方式使用。默认情况下，工具栏在桌面上高为64px，在移动设备上高为56px；`v-toolbar`组件有两个辅助组件用于辅助完成界面；`v-toolbar-title`用于显示标题，`v-toolbar-items`允许v-btn扩展高度“100%”。

#### props

| 属性名           | 属性值类型     | 属性默认值 | 属性描述                             |
| ---------------- | -------------- | ---------- | ------------------------------------ |
| absolute         | boolean        |            |                                      |
| bottom           | boolean        |            | 将组件底部对齐                       |
| collapse         | boolean        |            | 将工具栏置于折叠状态，减小其最大宽度 |
| color            | string         |            |                                      |
| dark             | boolean        |            |                                      |
| dense            | boolean        |            |                                      |
| elevation        | number\|string |            |                                      |
| extended         | boolean        |            |                                      |
| extension-height | number\|string |            |                                      |
| flat             | boolean        |            |                                      |
| floating         | boolean        |            |                                      |
| height           | number\|string |            |                                      |
| light            | boolean        |            |                                      |
| max-height       |                |            |                                      |
| max-width        |                |            |                                      |
| min-height       |                |            |                                      |
| min-width        |                |            |                                      |
| prominent        |                |            |                                      |
| short            |                |            |                                      |
| src              |                |            |                                      |
| tag              |                |            |                                      |
| tile             |                |            |                                      |
| width            |                |            |                                      |

slots

| 插槽名    | 插槽描述                                                     |
| --------- | ------------------------------------------------------------ |
| extension | 插槽直接位于工具栏的主要内容下方。可以使用extension-height prop明确设置此插槽的高度。如果该槽没有内容，则可以使用扩展道具 |
| img       | 背景v-img组件。应使用v-bind =“props”应用范围道具             |



### v-toolbar-title

用于展示`v-toolbar`的title

#### v-toolbar-items

配合v-btn实现导航栏展示



### v-bottom-navigation

v-bottom-navigation是侧边栏的替代品；它主要用于移动设备

#### props

| 属性名           | 属性值类型 | 属性默认值 | 属性描述                                                    |
| ---------------- | ---------- | ---------- | ----------------------------------------------------------- |
| absolute         | boolean    |            |                                                             |
| active-class     | string     |            |                                                             |
| app              | boolean    |            |                                                             |
| background-color | string     |            |                                                             |
| color            | string     |            |                                                             |
| dark             |            |            |                                                             |
| fixed            |            |            |                                                             |
| grow             | boolean    |            | v-btns占用所有可用空间                                      |
| height           |            |            |                                                             |
| hide-on-scroll   |            |            |                                                             |
| horizontal       | boolean    |            | 使v-btn的文字和图标横向排列                                 |
| input-value      | boolean    |            | 控制组件是可见还是隐藏。支持.sync修饰符                     |
| light            |            |            |                                                             |
| mandatory        | boolean    |            | 强制始终选择值（如果可用）                                  |
| max-height       |            |            |                                                             |
| max-width        |            |            |                                                             |
| min-height       |            |            |                                                             |
| min-width        |            |            |                                                             |
| scroll-target    |            |            |                                                             |
| scroll-threshold |            |            |                                                             |
| shift            |            |            |                                                             |
| value            | any        |            | 保持当前活动的v-btn的值。如果按钮没有提供值，则将使用其索引 |
| width            |            |            |                                                             |

#### event

change:当前所选按钮的值。如果没有值，则将是按钮的当前索引

update:input-value:该事件用于input-value.sync



### V-bottom-sheet

`v-bottom-sheet`是一个修改过的`v-dialog`;从屏幕底部滑动出来；类似于`v-bottom-navigation`;

#### props

| 属性名             | 属性值类型 | 属性默认值 | 属性描述                                                     |
| ------------------ | ---------- | ---------- | ------------------------------------------------------------ |
| activator          | any        | undefined  | 当未使用`activator`插槽时可以指定一个自定义的`activator`;值时string时可以是任何有效的`querySelector`；值是`object`时可以是任何有效的node |
| attach             | any        | false      | 指定该组件要分离的基准元素；默认是v-app                      |
| content-class      | string     |            | 将自定义类应用于分离的元素，因为内容被移动到v-app组件的开头（除非提供了附加prop），并且不能通过直接在组件上传递的类来定位 |
| dark               | boolean    |            |                                                              |
| disabled           | boolean    |            | 禁用打开组件的功能                                           |
| eager              | boolean    |            | 将强制组件内容在安装时呈现。如果您的内容不会在您想要为SEO搜索的DOM中呈现，这将非常有用 |
| full-width         | boolean    |            | 强制对话框扩展100％的可用宽度                                |
| fullscreen         | boolean    |            | 更改全屏显示的布局                                           |
| hide-overlay       | boolean    |            | 隐藏插件的黑色透明背景                                       |
| inset              | boolean    |            | 降低该组件的高度到原高度的70%                                |
| internal-activator | boolean    |            | 分离组件的item而不是document                                 |
| light              | boolean    |            |                                                              |
| max-width          |            |            |                                                              |
| no-click-animation | boolean    |            | 使用`persistent`属性后点击内容后禁用弹性效果                 |
| open-on-hover      | boolean    |            | 指定组件是否应在其激活器悬停时激活。                         |
| origin             |            |            |                                                              |
| persistent         | boolean    |            | 单击元素外部不会停用它                                       |
| retain-focus       | boolean    |            |                                                              |
| scrollable         | boolean    |            | 设置为true时，需要具有指定高度的v-card和v-card-text组件      |
| transition         | string     |            |                                                              |
| value              | any        |            | 控制组件是可见还是隐藏                                       |
| width              |            |            |                                                              |

#### slots

| 插槽名    | 插槽描述                                                     | 插槽绑定的值                                               |
| --------- | ------------------------------------------------------------ | ---------------------------------------------------------- |
| activator | 使用时，将在单击时激活组件（或将鼠标悬停在特定组件上）。这会手动停止事件传播。如果没有此插槽，如果通过其模型打开组件，则需要手动停止事件传播 | `{   on: { [eventName]: eventHandler }   value: boolean }` |



### v-breadcrumbs

`v-breadcrumbs`组件是页面的导航帮助器；分隔符可以设置成icon或者字符；可以将对象数组传递给组件的items属性；此外，存在用于更多控制面包屑的插槽，使用v-breadcrumbs-item或其他自定义标记

props

| 属性名  | 属性值类型 | 属性默认值 | 属性描述                                                     |
| ------- | ---------- | ---------- | ------------------------------------------------------------ |
| dark    | boolean    |            |                                                              |
| divider | string     | '/'        | 指定面包屑导航之间的分隔字符                                 |
| items   | array      | 空数组     | 每个面包屑的对象数组；例如`[   {     href: string     disabled: boolean     link: boolean     text: string | number     to: string | object   } ]` |
| large   | boolean    |            | 将字体大小由14px增加到16px                                   |
| light   |            |            |                                                              |

#### slots

divider：该插槽用于设置面包屑的分隔符

item：当使用items属性时；该插槽用于覆盖默认的`v-itemcrumbs-item`

#### v-breadcrumbs-item

##### props

| 属性名             | 属性值类型      | 属性默认值                      | 属性描述                                                     |
| ------------------ | --------------- | ------------------------------- | ------------------------------------------------------------ |
| active-class       | string          | `v-breadcrumbs__item--disabled` | 配置链接处于活动状态时应用的活动CSS类                        |
| append             | boolean         |                                 | 设置append属性后；面包屑总是添加相对地址基于当前路径         |
| disabled           | boolean         |                                 | 移除该组件的点击和target功能                                 |
| exact              | boolean         |                                 | 完全匹配链接                                                 |
| exact-active-class | string          |                                 | 配置链接处于活动状态且精确匹配时应用的活动CSS类              |
| href               | string\|object  |                                 | 将组件指定为锚并应用href属性                                 |
| link               | boolean         |                                 | 指定组件是链接；当设置href属性或者to属性时自动设置为true     |
| nuxt               | boolean         |                                 | 指定链接是一个nuxt-link                                      |
| replace            | boolean         |                                 | 设置`replace`属性后将使用`router.replace()`替代`router.push()` |
| ripple             | boolean\|object |                                 | 应用v-ripple指令                                             |
| tag                |                 |                                 |                                                              |
| target             | string          |                                 | 为组件指定一个链接；该链接自动用于href属性或者to属性         |
| to                 | string\|object  |                                 | 设置将要跳转的路由                                           |



### v-btn

使用`v-btn`组件将替代html标准的`button`按钮；该组件可以使用与定义好的属性和样式；

#### props

| 属性名             | 属性值类型      | 属性默认值 | 属性描述                                                     |
| ------------------ | --------------- | ---------- | ------------------------------------------------------------ |
| absolute           | boolean         |            |                                                              |
| active-class       | string          |            | 设置处于点击状态的css样式                                    |
| append             | boolean         |            | 设置append属性总是添加相对地址到当前路径；应用与vue-router   |
| block              | boolean         |            | 使按钮占用可用空间的所有部分                                 |
| bottom             | boolean         |            | 使组件底部对齐                                               |
| color              | string          |            |                                                              |
| dark               | boolean         |            |                                                              |
| depressed          | boolean         |            | 移除按钮的阴影效果                                           |
| disabled           | boolean         |            |                                                              |
| elevation          |                 |            |                                                              |
| exact              | boolean         |            |                                                              |
| exact-active-class |                 |            |                                                              |
| fab                | boolean         |            | 将按钮指定为浮动操作按钮 - 圆形                              |
| fixed              |                 |            |                                                              |
| height             |                 |            |                                                              |
| href               |                 |            |                                                              |
| icon               | boolean         |            | 将按钮指定为图标 - 圆形和扁平                                |
| input-value        | any             |            | 控制按钮的活动状态                                           |
| large              | boolean         |            |                                                              |
| left               | boolean         |            | 将组件向左对齐；基于`absolute`属性或者`fixed`属性            |
| light              | boolean         |            |                                                              |
| link               | boolean         |            | 为组件指定一个链接；该链接自动用于href属性或者to属性         |
| loading            | boolean         |            | 该组件为true时自动添加一个loading动画                        |
| max-height         |                 |            |                                                              |
| max-width          |                 |            |                                                              |
| min-height         |                 |            |                                                              |
| min-width          |                 |            |                                                              |
| nuxt               |                 |            |                                                              |
| outlined           | boolean         |            | 使用透明背景并添加细边框                                     |
| replace            |                 |            | 设置`replace`属性后将使用`router.replace()`替代`router.push()` |
| right              |                 |            |                                                              |
| ripple             | boolean\|object |            | 应用v-ripple指令                                             |
| rounded            | boolean         |            | 添加大圆角效果                                               |
| small              | boolean         |            | 使用预定义好的小组件                                         |
| target             |                 |            |                                                              |
| tile               |                 |            |                                                              |
| to                 | string\|object  |            |                                                              |
| top                |                 |            |                                                              |
| type               |                 |            |                                                              |
| value              |                 |            |                                                              |
| width              |                 |            |                                                              |
| x-large            | boolean         |            | 使组件增大                                                   |
| x-small            | boolean         |            | 使组件减小                                                   |

#### slots

`loader`自定义loader动画的插槽

#### v-btn-toggle

props

| 属性名       | 属性类型       | 属性默认值       | 属性描述                       |
| ------------ | -------------- | ---------------- | ------------------------------ |
| active-class | string         | `v-item--active` | 当该组件被选中时应用于子元素   |
| color        | string         |                  |                                |
| dark         |                |                  |                                |
| light        |                |                  |                                |
| mandatory    |                |                  |                                |
| max          | number\|string |                  | 设置可以进行的最大选择数       |
| multiple     | boolean        |                  | 允许多个选择。值prop必须是数组 |
| rounded      |                |                  |                                |
| value        |                |                  |                                |

#### events

change: 检测用户的输入发生改变



### buttons：floating action button

`v-btn`组件能够作为一个浮动的功能按钮；综合使用`v-speed-dial`组件；您可以为用户创建各种功能

### v-speed-dial

| 属性名        | 属性值类型 | 属性默认值 | 属性描述                                                     |
| ------------- | ---------- | ---------- | ------------------------------------------------------------ |
| direction     | string     | `top`      | 快捷按钮的显示方向控制；可以设置的值有`top/bottom/left/right` |
| fixed         | boolean    |            |                                                              |
| left          | boolean    |            |                                                              |
| mode          | string     |            | 设置动画的变换模式                                           |
| open-on-hover |            |            |                                                              |
| origin        |            |            |                                                              |
| right         |            |            |                                                              |
| top           |            |            |                                                              |
| transition    |            |            |                                                              |
| value         |            |            |                                                              |

slots

activator：



### v-calendar：日历组件

`v-calendar`组件用于展示日常信息；周界面或者月界面；该组件设有多个插槽用于显示每一天的的全天，日期元素，星期或者月视图；您可以选择传递一系列（数组）事件，并在适当的日期和时间内呈现它们

该u组件据有属性（type）和值（value）用于确定什么类型的日历和显示时间跨度；

props

| 属性名              | 属性类型         | 属性默认值                     | 属性描述                                                     |
| ------------------- | ---------------- | ------------------------------ | ------------------------------------------------------------ |
| color               | string           |                                |                                                              |
| dark                | boolean          |                                |                                                              |
| day-format          | function         | null                           | 将一天中出现的字符串格式化为指定地区格式                     |
| end                 | string           |                                | 日历的结束日期；使用`YYYY-MM-DD`格式                         |
| event-color         | string\|function | secondary                      | 所有事件的背景颜色或接受传递给日历以返回颜色的事件对象的函数 |
| event-end           | string           | ‘end’                          | 设置事件结束时间戳的属性                                     |
| event-height        | number           |                                | 在月视图和日视图中；事件选中的样式的高度；单位像素           |
| event-margin-bottom | number           |                                | 事件描述出来的标签距离底部的高度                             |
| event-more          | boolean          |                                | 是否在指定日期内具有太多事件的日历上显示更多“按钮”           |
| event-more-text     | string           | `$vuetify.calendar.moreEvents` | 给定隐藏事件数量的更多“按钮”中显示的文本                     |
| event-name          | string\|function | name                           | 设置事件显示名称的属性，或者接受作为第一个参数传递给日历的事件对象的函数，以及表示该名称是用于定时事件（true）还是一天中的事件的标志 |
| event-ripple        | boolean\|object  |                                | 使用`v-ripple`指令                                           |
| event-start         | string           | `start`                        | 设置事件的开始时间戳的属性                                   |
| event-text-color    | string\|function | white                          | 所有事件的文本颜色或接受传递给日历以返回颜色的事件对象的函数 |
| events              | array            | []                             | 一组事件对象，具有开始时间戳的属性以及可选的名称和结束时间戳。如果未给出结束时间戳，则将使用start的值。如果没有给出名称，则必须提供事件槽的实现 |
| first-interval      | number\|string   | 0                              | 在`day`视图中显示第一个间隔；如果`intervalMinutes`设置60并且该属性设置为9；则在视图中第一次的时间设置为9am |
| hide-header         | boolean          | false                          | 如果设为flase在日视图顶部的header应该可见                    |
| interval-count      | number\|string   | 24                             | 间隔的数字用于展示在日视图中                                 |
| interval-format     | function         | null                           | 在区间中设置格式化的字符串用于指定特定格式显示`day`和`view`视图 |
| interval-height     | number\|string   | 40                             | 日视图中间隔的高度（以像素为单位）                           |
| interval-minutes    | number\|string   | 60                             | 日视图中间隔的分钟数。常用间隔为60分钟，因此间隔为一小时     |
| interval-style      | function         | null                           | 返回要应用于间隔的CSS样式                                    |
| light               | boolean          |                                |                                                              |
| locale              | string           |                                | 使用当地格式的日历                                           |
| max-days            | number           | 7                              | 如果未设置结束日期，则在自定义日历中显示的最大天数           |
| min-weeks           | any              | 1                              | 在月视图或周视图中显示的最小周数                             |
| month-format        | function         | null                           | 格式化月字符串用于显示在指定local下一天的显示                |
| now                 | string           |                                | 覆盖现在考虑的日期和时间。格式为YYYY-MM-DD hh：mm：ss。日历根据现在的样式 |
| short-intervals     | boolean          |                                | 如果设置为true；则日视图显示的是`9AM`而不是`09:00AM`         |
| short-months        | boolean          |                                | 以简写的形式写出月份                                         |
| short-weekdays      | boolean          |                                | 以简写的形式写出周（Mon vs Monday）                          |
| show-month-on-first | boolean          |                                | 是否应在月份的第一天显示月份名称                             |
| start               | string           |                                | 当前日期以`YYYY-MM-DD`的格式设置；设置type属性后可能被忽略掉 |
| type                | string           | `month`                        | 可选的值`month/week/day/4day/custom-weekly/custom-daily`中的一个；自定义类型依赖的是`start`属性和`end`属性；而不是`value`属性 |
| value               | string           |                                | 格式为`YYYY-MM-DD`的日期字符串；用于确定日历的时间跨度       |
| weekday-format      | function         |                                | 格式化周字符串用于在header中显示指定格式的周字符串           |
| weekdays            | array            | [0,1,2,3,4,5,6]                | 指定一周显示的星期的格式；0表示周末                          |

#### slots:该组件与定义的插槽

`day`:该插槽用于周视图或者月视图中；需要使用作用于插槽传参数；参数格式如下：

~~~js
{
  date: string
  time: string
  year: number
  month: number
  day: number
  hour: number
  minute: number
  weekday: number
  hasDay: boolean
  hasTime: boolean
  past: boolean
  present: boolean
  future: boolean
}
~~~

`day-body`:放置在可滚动间隔容器中的日视图中的内容；日期和时间对象通过作用域插槽实现；作用域的props属性如下：

~~~js
{
  date: string
  time: string
  year: number
  month: number
  day: number
  hour: number
  minute: number
  weekday: number
  hasDay: boolean
  hasTime: boolean
  past: boolean
  present: boolean
  future: boolean
  timeToY: (time: string | number | {hour: number, minute: number}, clamp: boolean = false): number
}
~~~

`day-header`:该插槽内容用于在日视图中显示顶部内容；该插槽是一个作用域插槽；需要绑定数据；数据格式如下：

~~~
{
  date: string
  time: string
  year: number
  month: number
  day: number
  hour: number
  minute: number
  weekday: number
  hasDay: boolean
  hasTime: boolean
  past: boolean
  present: boolean
  future: boolean
}
~~~

`day-label`:该作用域插槽用于在周视图和月视图中放置在月份空间里的内容;需要绑定的数据格式如下

~~~js
{
  date: string
  time: string
  year: number
  month: number
  day: number
  hour: number
  minute: number
  weekday: number
  hasDay: boolean
  hasTime: boolean
  past: boolean
  present: boolean
  future: boolean
}
~~~

`day-month`：该作用域插槽用于展示放置在周视图或月视图中的月份空间中的内容；需要绑定的数据如下：

~~~
{
  date: string
  time: string
  year: number
  month: number
  day: number
  hour: number
  minute: number
  weekday: number
  hasDay: boolean
  hasTime: boolean
  past: boolean
  present: boolean
  future: boolean
}
~~~

`interval`:放置在日视图中的间隔空间中的内容;需要绑定的数据

~~~
{
  date: string
  time: string
  year: number
  month: number
  day: number
  hour: number
  minute: number
  weekday: number
  hasDay: boolean
  hasTime: boolean
  past: boolean
  present: boolean
  future: boolean
  timeToY: (time: string | number | {hour: number, minute: number}, clamp: boolean = false): number
}
~~~

#### events

`change`:日历上显示的天数已更改。这是在初始化时触发的。传递的事件是具有开始和结束日期对象的对象。

~~~js
{
  start: {
    date: string
    time: string
    year: number
    month: number
    day: number
    hour: number
    minute: number
    weekday: number
    hasDay: boolean
    hasTime: boolean
    past: boolean
    present: boolean
    future: boolean
  },
  end: {
    date: string
    time: string
    year: number
    month: number
    day: number
    hour: number
    minute: number
    weekday: number
    hasDay: boolean
    hasTime: boolean
    past: boolean
    present: boolean
    future: boolean
  }
}
~~~

`click:date`：在月份视图上的天模块的点击；绑定的数据：

~~~
{
  date: string
  time: string
  year: number
  month: number
  day: number
  hour: number
  minute: number
  weekday: number
  hasDay: boolean
  hasTime: boolean
  past: boolean
  present: boolean
  future: boolean
  timeToY: (time: string | number | {hour: number, minute: number}, clamp: boolean = false): number
}
~~~

`click:day` 在天视图模块上的点击；需要绑定的数据

~~~
{
  date: string
  time: string
  year: number
  month: number
  day: number
  hour: number
  minute: number
  weekday: number
  hasDay: boolean
  hasTime: boolean
  past: boolean
  present: boolean
  future: boolean
  timeToY: (time: string | number | {hour: number, minute: number}, clamp: boolean = false): number
}
~~~

`click:interval`:日视图中特定间隔标签处的单击事件;需要绑定的事件

~~~
{
  date: string
  time: string
  year: number
  month: number
  day: number
  hour: number
  minute: number
  weekday: number
  hasDay: boolean
  hasTime: boolean
  past: boolean
  present: boolean
  future: boolean
}
~~~

`click:time`:日视图中特定时间的点击事件;需要绑定的数据

~~~
{
  date: string
  time: string
  year: number
  month: number
  day: number
  hour: number
  minute: number
  weekday: number
  hasDay: boolean
  hasTime: boolean
  past: boolean
  present: boolean
  future: boolean
  timeToY: (time: string | number | {hour: number, minute: number}, clamp: boolean = false): number
}
~~~

`contextmenu:date`:月份链接上的右键单击事件;需要绑定的数据

~~~
{
  date: string
  time: string
  year: number
  month: number
  day: number
  hour: number
  minute: number
  weekday: number
  hasDay: boolean
  hasTime: boolean
  past: boolean
  present: boolean
  future: boolean
  timeToY: (time: string | number | {hour: number, minute: number}, clamp: boolean = false): number
}
~~~

`contextmenu:interval`:日视图中特定间隔标签上的右键单击事件;需要绑定的事件





### 































