---
title: bootstrap源码解读
tags: bootstrap4.x源码解读
---

早就知道bootstrap；但是对他的认知仅仅存在使用；而且是现查现用的阶段；最近再次使用bootsrap4进行构建公司官网；因此也是一个自己很好从新认识代码的机会；现将自己的学习总结与大家共享；希望能一起讨论精选页面。

## 学习bootstrap之路

从bootstrap4开始样式文件预编译使用`SCSS`;但在这里不多做补充；希望能够自己去看下scss指南；该文章主要是解读的scss文件目录和js文件目录；目录结构如下：

~~~

├── _alert.scss	// 警告-组件
├── _badge.scss // 徽章-组件
├── _breadcrumb.scss //面包屑-组件
├── _button-group.scss	// 按钮组-组件
├── _buttons.scss	// 按钮-组件
├── _card.scss	// 卡片-组件
├── _carousel.scss	// 轮播-组件
├── _close.scss	// 关闭-全局样式
├── _code.scss	// 代码-内容
├── _custom-forms.scss	// 表单_自定义表单-组件
├── _dropdown.scss	// 下拉菜单
├── _forms.scss	// 表单-组件
├── _functions.scss	 // 公共方法
├── _grid.scss	 // 栅格-布局
├── _images.scss	// 图片、图解-内容
├── _input-group.scss  // 输入类-组件
├── _jumbotron.scss	// 超大屏-组件
├── _list-group.scss	 // 列表类-组件
├── _media.scss	 // 媒体-布局
├── _mixins.scss	 // 总的@mixin方法，，引用mixins目录下文件
├── _modal.scss	 // 模态框-组件
├── _nav.scss	 // 导航-组件
├── _navbar.scss	 // 导航条-组件
├── _pagination.scss	 // 分页-组件
├── _popover.scss	// 弹出框-组件
├── _print.scss	 // 打印样式
├── _progress.scss	 // 进度条-组件
├── _reboot.scss	// 初始化样式
├── _root.scss	 // 基本颜色、屏幕断点
├── _spinners.scss
├── _tables.scss	// 表格-内容
├── _toasts.scss	 // 
├── _tooltip.scss	 // 工具提示-组件
├── _transitions.scss	 // 过渡效果：折叠，显示隐藏
├── _type.scss	// 排版-内容
├── _utilities.scss	// 总的全局样式，引用utilities目录下文件
├── _variables.scss	// 变量集合
├── bootstrap-grid.scss	//栅格CSS
├── bootstrap-reboot.scss	//启动CSS
├── bootstrap.scss	//完整css
├── mixins	//定义一些@mixin方法
│   ├── _alert.scss
│   ├── _background-variant.scss
│   ├── _border-radius.scss
│   ├── _box-shadow.scss
│   ├── _breakpoints.scss
│   ├── _buttons.scss
│   ├── _caret.scss
│   ├── _clearfix.scss
│   ├── _deprecate.scss
│   ├── _forms.scss
│   ├── _gradients.scss
│   ├── _grid-framework.scss
│   ├── _grid.scss
│   ├── _hover.scss
│   ├── _image.scss
│   ├── _list-group.scss
│   ├── _lists.scss
│   ├── _nav-divider.scss
│   ├── _pagination.scss
│   ├── _reset-text.scss
│   ├── _resize.scss
│   ├── _screen-reader.scss
│   ├── _table-row.scss
│   ├── _text-emphasis.scss
│   ├── _text-truncate.scss
│   └── _transition.scss
├── utilities	//全局样式
│   ├── _align.scss	// 文字对其方式；默认baseline；类名 .align-baseline
│   ├── _background.scss	//定义背景色；类名 .bg-*
│   ├── _borders.scss	//定义边框
│   ├── _clearfix.scss	//使用伪元素清除浮动
│   ├── _display.scss	//设置display的属性值；.d-*
│   ├── _embed.scss	//css定位套件 .embed-responsive 
│   ├── _flex.scss	//设置flex属性值
│   ├── _float.scss	//设置浮动
│   ├── _overflow.scss	//设置超出部分处理属性
│   ├── _position.scss	//设置定位属性 .fixed-top/.fixed-bottom/.sticky-top/.position-*
│   ├── _screenreaders.scss	//屏幕辅助属性
│   ├── _shadows.scss	//.shadow-sm/.shadow/shadow-lg/.shadow-none
│   ├── _sizing.scss	//定义宽度和高度
│   ├── _spacing.scss	//定义margin和padding值
│   ├── _stretched-link.scss	//.stretched-link
│   ├── _text.scss	// 定义 text-align/text-transform/font-weight/color属性
│   └── _visibility.scss	//定义visibility属性；.visible/.invisible
└── vendor
    └── _rfs.scss	// 设置自动响应式字体的大小
~~~

## 组件

### alert组件

_alert.scss:包含`.alert/.alert-heading/.alert-link/.alert-dismissible .close以及定义的alert-$themi-colors`;使用带有关闭按钮的alert提示框必须使用类名`.alert-dismissible`和子类名`.close`;使用`.show.fade`类名来控制关闭效果

~~~
<div class="alert alert-success alert-dismissible fade show">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>成功!</strong> 指定操作成功提示信息。
  </div>
~~~

### badge组件

徽章badge用于突出显示新的或者未读的项；`.badge`设置行内块；居中对齐；设置padding值；在`.btn`按钮内部的`.badge`相对定位；并向上移一像素；

~~~scss
.badge {
  display: inline-block;
  padding: $badge-padding-y $badge-padding-x;
  @include font-size($badge-font-size);
  font-weight: $badge-font-weight;
  line-height: 1;
  color: $badge-color;
  text-align: center;
  white-space: nowrap;
  vertical-align: baseline;
  @include border-radius($badge-border-radius);

  // Empty badges collapse automatically
  &:empty {
    display: none;
  }
}

// Quick fix for badges in buttons
.btn .badge {
  position: relative;
  top: -1px;
}
~~~

### 面包屑导航

面包屑导航是一种基于网站层次信息的显示方式。以博客为例，面包屑导航可以显示发布日期、类别或标签。它们表示当前页面在导航层次结构内的位置，是在用户界面中的一种导航辅助。Bootstrap 中的面包屑导航是一个简单的带有 **.breadcrumb** class 的无序列表。分隔符会通过 CSS（bootstrap.min.css）中的 ::before 和 content 来添加

~~~scss
.breadcrumb {
  display: flex;
  flex-wrap: wrap;
  padding: $breadcrumb-padding-y $breadcrumb-padding-x;
  margin-bottom: $breadcrumb-margin-bottom;
  list-style: none;
  background-color: $breadcrumb-bg;
  @include border-radius($breadcrumb-border-radius);
}

.breadcrumb-item {
  // The separator between breadcrumbs (by default, a forward-slash: "/")
  + .breadcrumb-item {
    padding-left: $breadcrumb-item-padding-x;

    &::before {
      display: inline-block; // Suppress underlining of the separator in modern browsers
      padding-right: $breadcrumb-item-padding-x;
      color: $breadcrumb-divider-color;
      content: $breadcrumb-divider;
    }
  }

  // IE9-11 hack to properly handle hyperlink underlines for breadcrumbs built
  // without `<ul>`s. The `::before` pseudo-element generates an element
  // *within* the .breadcrumb-item and thereby inherits the `text-decoration`.
  //
  // To trick IE into suppressing the underline, we give the pseudo-element an
  // underline and then immediately remove it.
  + .breadcrumb-item:hover::before {
    text-decoration: underline;
  }
  // stylelint-disable-next-line no-duplicate-selectors
  + .breadcrumb-item:hover::before {
    text-decoration: none;
  }

  &.active {
    color: $breadcrumb-active-color;
  }
}
~~~

### 按钮组件

_button.scss：按钮类可用于` <a>, <button>,` 或` <input>` 元素上:按钮设置边框，大小不同的按钮；块级按钮/激活和禁用的按钮

~~~scss

.btn {
  display: inline-block;
  font-family: $btn-font-family;
  font-weight: $btn-font-weight;
  color: $body-color;
  text-align: center;
  vertical-align: middle;
  user-select: none;
  background-color: transparent;
  border: $btn-border-width solid transparent;
  @include button-size($btn-padding-y, $btn-padding-x, $btn-font-size, $btn-line-height, $btn-border-radius);
  @include transition($btn-transition);

  @include hover {
    color: $body-color;
    text-decoration: none;
  }

  &:focus,
  &.focus {
    outline: 0;
    box-shadow: $btn-focus-box-shadow;
  }

  // Disabled comes first so active can properly restyle
  &.disabled,
  &:disabled {
    opacity: $btn-disabled-opacity;
    @include box-shadow(none);
  }

  &:not(:disabled):not(.disabled):active,
  &:not(:disabled):not(.disabled).active {
    @include box-shadow($btn-active-box-shadow);

    &:focus {
      @include box-shadow($btn-focus-box-shadow, $btn-active-box-shadow);
    }
  }
}

// Future-proof disabling of clicks on `<a>` elements
a.btn.disabled,
fieldset:disabled a.btn {
  pointer-events: none;
}


//
// Alternate buttons
// 

@each $color, $value in $theme-colors {
  .btn-#{$color} {
    @include button-variant($value, $value);
  }
}

@each $color, $value in $theme-colors {
  .btn-outline-#{$color} {
    @include button-outline-variant($value);
  }
}


//
// Link buttons
//

// Make a button look and behave like a link
.btn-link {
  font-weight: $font-weight-normal;
  color: $link-color;
  text-decoration: $link-decoration;

  @include hover {
    color: $link-hover-color;
    text-decoration: $link-hover-decoration;
  }

  &:focus,
  &.focus {
    text-decoration: $link-hover-decoration;
    box-shadow: none;
  }

  &:disabled,
  &.disabled {
    color: $btn-link-disabled-color;
    pointer-events: none;
  }

  // No need for an active state here
}


//
// Button Sizes
//

.btn-lg {
  @include button-size($btn-padding-y-lg, $btn-padding-x-lg, $btn-font-size-lg, $btn-line-height-lg, $btn-border-radius-lg);
}

.btn-sm {
  @include button-size($btn-padding-y-sm, $btn-padding-x-sm, $btn-font-size-sm, $btn-line-height-sm, $btn-border-radius-sm);
}


//
// Block button
//

.btn-block {
  display: block;
  width: 100%;

  // Vertically space out multiple block buttons
  + .btn-block {
    margin-top: $btn-block-spacing-y;
  }
}

// Specificity overrides
input[type="submit"],
input[type="reset"],
input[type="button"] {
  &.btn-block {
    width: 100%;
  }
}
~~~

### 按钮组组件

Button-group.scss:按钮组是用来实现特定功能的按钮的集合；如播放器的控制栏

~~~scss
// Make the div behave like a button
.btn-group,
.btn-group-vertical {
  position: relative;
  display: inline-flex;
  vertical-align: middle; // match .btn alignment given font-size hack above

  > .btn {
    position: relative;
    flex: 1 1 auto;

    // Bring the hover, focused, and "active" buttons to the front to overlay
    // the borders properly
    @include hover {
      z-index: 1;
    }
    &:focus,
    &:active,
    &.active {
      z-index: 1;
    }
  }
}

// Optional: Group multiple button groups together for a toolbar
.btn-toolbar {
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-start;

  .input-group {
    width: auto;
  }
}

.btn-group {
  // Prevent double borders when buttons are next to each other
  > .btn:not(:first-child),
  > .btn-group:not(:first-child) {
    margin-left: -$btn-border-width;
  }

  // Reset rounded corners
  > .btn:not(:last-child):not(.dropdown-toggle),
  > .btn-group:not(:last-child) > .btn {
    @include border-right-radius(0);
  }

  > .btn:not(:first-child),
  > .btn-group:not(:first-child) > .btn {
    @include border-left-radius(0);
  }
}

// Sizing
//
// Remix the default button sizing classes into new ones for easier manipulation.

.btn-group-sm > .btn { @extend .btn-sm; }
.btn-group-lg > .btn { @extend .btn-lg; }


//
// Split button dropdowns
//

.dropdown-toggle-split {
  padding-right: $btn-padding-x * .75;
  padding-left: $btn-padding-x * .75;

  &::after,
  .dropup &::after,
  .dropright &::after {
    margin-left: 0;
  }

  .dropleft &::before {
    margin-right: 0;
  }
}

.btn-sm + .dropdown-toggle-split {
  padding-right: $btn-padding-x-sm * .75;
  padding-left: $btn-padding-x-sm * .75;
}

.btn-lg + .dropdown-toggle-split {
  padding-right: $btn-padding-x-lg * .75;
  padding-left: $btn-padding-x-lg * .75;
}


// The clickable button for toggling the menu
// Set the same inset shadow as the :active state
.btn-group.show .dropdown-toggle {
  @include box-shadow($btn-active-box-shadow);

  // Show no shadow for `.btn-link` since it has no other button styles.
  &.btn-link {
    @include box-shadow(none);
  }
}


//
// Vertical button groups
//

.btn-group-vertical {
  flex-direction: column;
  align-items: flex-start;
  justify-content: center;

  > .btn,
  > .btn-group {
    width: 100%;
  }

  > .btn:not(:first-child),
  > .btn-group:not(:first-child) {
    margin-top: -$btn-border-width;
  }

  // Reset rounded corners
  > .btn:not(:last-child):not(.dropdown-toggle),
  > .btn-group:not(:last-child) > .btn {
    @include border-bottom-radius(0);
  }

  > .btn:not(:first-child),
  > .btn-group:not(:first-child) > .btn {
    @include border-top-radius(0);
  }
}


// Checkbox and radio options
//
// In order to support the browser's form validation feedback, powered by the
// `required` attribute, we have to "hide" the inputs via `clip`. We cannot use
// `display: none;` or `visibility: hidden;` as that also hides the popover.
// Simply visually hiding the inputs via `opacity` would leave them clickable in
// certain cases which is prevented by using `clip` and `pointer-events`.
// This way, we ensure a DOM element is visible to position the popover from.
//
// See https://github.com/twbs/bootstrap/pull/12794 and
// https://github.com/twbs/bootstrap/pull/14559 for more information.

.btn-group-toggle {
  > .btn,
  > .btn-group > .btn {
    margin-bottom: 0; // Override default `<label>` value

    input[type="radio"],
    input[type="checkbox"] {
      position: absolute;
      clip: rect(0, 0, 0, 0);
      pointer-events: none;
    }
  }
}
~~~

### 卡片组件

card.scss:可以使用card类名和card-body类名来创建一个简单的卡片