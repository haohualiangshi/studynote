---
title: bootstrap源码解读二
tags: bootstrap-css源码解读
---

### 自定义表单组件

custom-form.scss:自定义一些表单的样式来替换浏览器的默认样式;组件内自定义了复选框/单选框/自定义控件显示在同一行/自定义选择菜单/自定义滑块/自定义文件上传控件

~~~scss
// 自定义表单容器
.custom-control {
  position: relative;
  display: block;
  min-height: $font-size-base * $line-height-base;
  padding-left: $custom-control-gutter + $custom-control-indicator-size;
}
//让自定义控件显示在同一行
.custom-control-inline {
  display: inline-flex;
  margin-right: $custom-control-spacer-x;
}

.custom-control-input {
  position: absolute;
  z-index: -1; // Put the input behind the label so it doesn't overlay text
  opacity: 0;

  &:checked ~ .custom-control-label::before {
    color: $custom-control-indicator-checked-color;
    border-color: $custom-control-indicator-checked-border-color;
    @include gradient-bg($custom-control-indicator-checked-bg);
    @include box-shadow($custom-control-indicator-checked-box-shadow);
  }

  &:focus ~ .custom-control-label::before {
    // the mixin is not used here to make sure there is feedback
    @if $enable-shadows {
      box-shadow: $input-box-shadow, $input-focus-box-shadow;
    } @else {
      box-shadow: $custom-control-indicator-focus-box-shadow;
    }
  }

  &:focus:not(:checked) ~ .custom-control-label::before {
    border-color: $custom-control-indicator-focus-border-color;
  }

  &:not(:disabled):active ~ .custom-control-label::before {
    color: $custom-control-indicator-active-color;
    background-color: $custom-control-indicator-active-bg;
    border-color: $custom-control-indicator-active-border-color;
    @include box-shadow($custom-control-indicator-active-box-shadow);
  }
  &[disabled] {
    ~ .custom-control-label {
      color: $custom-control-label-disabled-color;

      &::before {
        background-color: $custom-control-indicator-disabled-bg;
      }
    }
  }
}

// Custom control indicators
//
// Build the custom controls out of pseudo-elements.

.custom-control-label {
  position: relative;
  margin-bottom: 0;
  vertical-align: top;

  // Background-color and (when enabled) gradient
  &::before {
    position: absolute;
    top: ($font-size-base * $line-height-base - $custom-control-indicator-size) / 2;
    left: -($custom-control-gutter + $custom-control-indicator-size);
    display: block;
    width: $custom-control-indicator-size;
    height: $custom-control-indicator-size;
    pointer-events: none;
    content: "";
    background-color: $custom-control-indicator-bg;
    border: $custom-control-indicator-border-color solid $custom-control-indicator-border-width;
    @include box-shadow($custom-control-indicator-box-shadow);
  }

  // Foreground (icon)
  &::after {
    position: absolute;
    top: ($font-size-base * $line-height-base - $custom-control-indicator-size) / 2;
    left: -($custom-control-gutter + $custom-control-indicator-size);
    display: block;
    width: $custom-control-indicator-size;
    height: $custom-control-indicator-size;
    content: "";
    background: no-repeat 50% / #{$custom-control-indicator-bg-size};
  }
}


// Checkboxes
//
// Tweak just a few things for checkboxes.
// 自定义复选框
.custom-checkbox {
  .custom-control-label::before {
    @include border-radius($custom-checkbox-indicator-border-radius);
  }

  .custom-control-input:checked ~ .custom-control-label {
    &::after {
      background-image: $custom-checkbox-indicator-icon-checked;
    }
  }

  .custom-control-input:indeterminate ~ .custom-control-label {
    &::before {
      border-color: $custom-checkbox-indicator-indeterminate-border-color;
      @include gradient-bg($custom-checkbox-indicator-indeterminate-bg);
      @include box-shadow($custom-checkbox-indicator-indeterminate-box-shadow);
    }
    &::after {
      background-image: $custom-checkbox-indicator-icon-indeterminate;
    }
  }

  .custom-control-input:disabled {
    &:checked ~ .custom-control-label::before {
      background-color: $custom-control-indicator-checked-disabled-bg;
    }
    &:indeterminate ~ .custom-control-label::before {
      background-color: $custom-control-indicator-checked-disabled-bg;
    }
  }
}

// Radios
//
// Tweak just a few things for radios.
//自定义单选框

.custom-radio {
  .custom-control-label::before {
    // stylelint-disable-next-line property-blacklist
    border-radius: $custom-radio-indicator-border-radius;
  }

  .custom-control-input:checked ~ .custom-control-label {
    &::after {
      background-image: $custom-radio-indicator-icon-checked;
    }
  }

  .custom-control-input:disabled {
    &:checked ~ .custom-control-label::before {
      background-color: $custom-control-indicator-checked-disabled-bg;
    }
  }
}


// switches
// 自定义开关
// Tweak a few things for switches


.custom-switch {
  padding-left: $custom-switch-width + $custom-control-gutter;

  .custom-control-label {
    &::before {
      left: -($custom-switch-width + $custom-control-gutter);
      width: $custom-switch-width;
      pointer-events: all;
      // stylelint-disable-next-line property-blacklist
      border-radius: $custom-switch-indicator-border-radius;
    }

    &::after {
      top: calc(#{(($font-size-base * $line-height-base - $custom-control-indicator-size) / 2)} + #{$custom-control-indicator-border-width * 2});
      left: calc(#{-($custom-switch-width + $custom-control-gutter)} + #{$custom-control-indicator-border-width * 2});
      width: $custom-switch-indicator-size;
      height: $custom-switch-indicator-size;
      background-color: $custom-control-indicator-border-color;
      // stylelint-disable-next-line property-blacklist
      border-radius: $custom-switch-indicator-border-radius;
      @include transition(transform .15s ease-in-out, $custom-forms-transition);
    }
  }

  .custom-control-input:checked ~ .custom-control-label {
    &::after {
      background-color: $custom-control-indicator-bg;
      transform: translateX($custom-switch-width - $custom-control-indicator-size);
    }
  }

  .custom-control-input:disabled {
    &:checked ~ .custom-control-label::before {
      background-color: $custom-control-indicator-checked-disabled-bg;
    }
  }
}


// Select
//
// Replaces the browser default select with a custom one, mostly pulled from
// https://primer.github.io/.
// 自定义选择菜单

.custom-select {
  display: inline-block;
  width: 100%;
  height: $custom-select-height;
  padding: $custom-select-padding-y ($custom-select-padding-x + $custom-select-indicator-padding) $custom-select-padding-y $custom-select-padding-x;
  font-family: $custom-select-font-family;
  @include font-size($custom-select-font-size);
  font-weight: $custom-select-font-weight;
  line-height: $custom-select-line-height;
  color: $custom-select-color;
  vertical-align: middle;
  background: $custom-select-background;
  background-color: $custom-select-bg;
  border: $custom-select-border-width solid $custom-select-border-color;
  @include border-radius($custom-select-border-radius, 0);
  @include box-shadow($custom-select-box-shadow);
  appearance: none;

  &:focus {
    border-color: $custom-select-focus-border-color;
    outline: 0;
    @if $enable-shadows {
      box-shadow: $custom-select-box-shadow, $custom-select-focus-box-shadow;
    } @else {
      box-shadow: $custom-select-focus-box-shadow;
    }

    &::-ms-value {
      // For visual consistency with other platforms/browsers,
      // suppress the default white text on blue background highlight given to
      // the selected option text when the (still closed) <select> receives focus
      // in IE and (under certain conditions) Edge.
      // See https://github.com/twbs/bootstrap/issues/19398.
      color: $input-color;
      background-color: $input-bg;
    }
  }

  &[multiple],
  &[size]:not([size="1"]) {
    height: auto;
    padding-right: $custom-select-padding-x;
    background-image: none;
  }

  &:disabled {
    color: $custom-select-disabled-color;
    background-color: $custom-select-disabled-bg;
  }

  // Hides the default caret in IE11
  &::-ms-expand {
    display: none;
  }
}

.custom-select-sm {
  height: $custom-select-height-sm;
  padding-top: $custom-select-padding-y-sm;
  padding-bottom: $custom-select-padding-y-sm;
  padding-left: $custom-select-padding-x-sm;
  @include font-size($custom-select-font-size-sm);
}

.custom-select-lg {
  height: $custom-select-height-lg;
  padding-top: $custom-select-padding-y-lg;
  padding-bottom: $custom-select-padding-y-lg;
  padding-left: $custom-select-padding-x-lg;
  @include font-size($custom-select-font-size-lg);
}


// File
// 自定义文件上传
// Custom file input.

.custom-file {
  position: relative;
  display: inline-block;
  width: 100%;
  height: $custom-file-height;
  margin-bottom: 0;
}

.custom-file-input {
  position: relative;
  z-index: 2;
  width: 100%;
  height: $custom-file-height;
  margin: 0;
  opacity: 0;

  &:focus ~ .custom-file-label {
    border-color: $custom-file-focus-border-color;
    box-shadow: $custom-file-focus-box-shadow;
  }

  // Use disabled attribute instead of :disabled pseudo-class
  // Workaround for: https://developer.microsoft.com/en-us/microsoft-edge/platform/issues/11295231
  &[disabled] ~ .custom-file-label {
    background-color: $custom-file-disabled-bg;
  }

  @each $lang, $value in $custom-file-text {
    &:lang(#{$lang}) ~ .custom-file-label::after {
      content: $value;
    }
  }

  ~ .custom-file-label[data-browse]::after {
    content: attr(data-browse);
  }
}

.custom-file-label {
  position: absolute;
  top: 0;
  right: 0;
  left: 0;
  z-index: 1;
  height: $custom-file-height;
  padding: $custom-file-padding-y $custom-file-padding-x;
  font-family: $custom-file-font-family;
  font-weight: $custom-file-font-weight;
  line-height: $custom-file-line-height;
  color: $custom-file-color;
  background-color: $custom-file-bg;
  border: $custom-file-border-width solid $custom-file-border-color;
  @include border-radius($custom-file-border-radius);
  @include box-shadow($custom-file-box-shadow);

  &::after {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    z-index: 3;
    display: block;
    height: $custom-file-height-inner;
    padding: $custom-file-padding-y $custom-file-padding-x;
    line-height: $custom-file-line-height;
    color: $custom-file-button-color;
    content: "Browse";
    @include gradient-bg($custom-file-button-bg);
    border-left: inherit;
    @include border-radius(0 $custom-file-border-radius $custom-file-border-radius 0);
  }
}

// Range
//// 自定义滑块
// Style range inputs the same across browsers. Vendor-specific rules for pseudo
// elements cannot be mixed. As such, there are no shared styles for focus or
// active states on prefixed selectors.

.custom-range {
  width: 100%;
  height: calc(#{$custom-range-thumb-height} + #{$custom-range-thumb-focus-box-shadow-width * 2});
  padding: 0; // Need to reset padding
  background-color: transparent;
  appearance: none;

  &:focus {
    outline: none;

    // Pseudo-elements must be split across multiple rulesets to have an effect.
    // No box-shadow() mixin for focus accessibility.
    &::-webkit-slider-thumb { box-shadow: $custom-range-thumb-focus-box-shadow; }
    &::-moz-range-thumb     { box-shadow: $custom-range-thumb-focus-box-shadow; }
    &::-ms-thumb            { box-shadow: $custom-range-thumb-focus-box-shadow; }
  }

  &::-moz-focus-outer {
    border: 0;
  }

  &::-webkit-slider-thumb {
    width: $custom-range-thumb-width;
    height: $custom-range-thumb-height;
    margin-top: ($custom-range-track-height - $custom-range-thumb-height) / 2; // Webkit specific
    @include gradient-bg($custom-range-thumb-bg);
    border: $custom-range-thumb-border;
    @include border-radius($custom-range-thumb-border-radius);
    @include box-shadow($custom-range-thumb-box-shadow);
    @include transition($custom-forms-transition);
    appearance: none;

    &:active {
      @include gradient-bg($custom-range-thumb-active-bg);
    }
  }

  &::-webkit-slider-runnable-track {
    width: $custom-range-track-width;
    height: $custom-range-track-height;
    color: transparent; // Why?
    cursor: $custom-range-track-cursor;
    background-color: $custom-range-track-bg;
    border-color: transparent;
    @include border-radius($custom-range-track-border-radius);
    @include box-shadow($custom-range-track-box-shadow);
  }

  &::-moz-range-thumb {
    width: $custom-range-thumb-width;
    height: $custom-range-thumb-height;
    @include gradient-bg($custom-range-thumb-bg);
    border: $custom-range-thumb-border;
    @include border-radius($custom-range-thumb-border-radius);
    @include box-shadow($custom-range-thumb-box-shadow);
    @include transition($custom-forms-transition);
    appearance: none;

    &:active {
      @include gradient-bg($custom-range-thumb-active-bg);
    }
  }

  &::-moz-range-track {
    width: $custom-range-track-width;
    height: $custom-range-track-height;
    color: transparent;
    cursor: $custom-range-track-cursor;
    background-color: $custom-range-track-bg;
    border-color: transparent; // Firefox specific?
    @include border-radius($custom-range-track-border-radius);
    @include box-shadow($custom-range-track-box-shadow);
  }

  &::-ms-thumb {
    width: $custom-range-thumb-width;
    height: $custom-range-thumb-height;
    margin-top: 0; // Edge specific
    margin-right: $custom-range-thumb-focus-box-shadow-width; // Workaround that overflowed box-shadow is hidden.
    margin-left: $custom-range-thumb-focus-box-shadow-width;  // Workaround that overflowed box-shadow is hidden.
    @include gradient-bg($custom-range-thumb-bg);
    border: $custom-range-thumb-border;
    @include border-radius($custom-range-thumb-border-radius);
    @include box-shadow($custom-range-thumb-box-shadow);
    @include transition($custom-forms-transition);
    appearance: none;

    &:active {
      @include gradient-bg($custom-range-thumb-active-bg);
    }
  }

  &::-ms-track {
    width: $custom-range-track-width;
    height: $custom-range-track-height;
    color: transparent;
    cursor: $custom-range-track-cursor;
    background-color: transparent;
    border-color: transparent;
    border-width: $custom-range-thumb-height / 2;
    @include box-shadow($custom-range-track-box-shadow);
  }

  &::-ms-fill-lower {
    background-color: $custom-range-track-bg;
    @include border-radius($custom-range-track-border-radius);
  }

  &::-ms-fill-upper {
    margin-right: 15px; // arbitrary?
    background-color: $custom-range-track-bg;
    @include border-radius($custom-range-track-border-radius);
  }

  &:disabled {
    &::-webkit-slider-thumb {
      background-color: $custom-range-thumb-disabled-bg;
    }

    &::-webkit-slider-runnable-track {
      cursor: default;
    }

    &::-moz-range-thumb {
      background-color: $custom-range-thumb-disabled-bg;
    }

    &::-moz-range-track {
      cursor: default;
    }

    &::-ms-thumb {
      background-color: $custom-range-thumb-disabled-bg;
    }
  }
}

.custom-control-label::before,
.custom-file-label,
.custom-select {
  @include transition($custom-forms-transition);
}

~~~

### 下拉组件

**dropdown.scss**:下拉菜单是可切换的；即以列表格式显示链接的上下文菜单；

demo：

~~~html
<div class="dropdown">
  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
    Dropdown button
  </button>
  <div class="dropdown-menu">
    <a class="dropdown-item" href="#">Link 1</a>
    <a class="dropdown-item" href="#">Link 2</a>
    <a class="dropdown-item" href="#">Link 3</a>
  </div>
</div>
~~~

~~~scss
// The dropdown wrapper (`<div>`)
.dropup,
.dropright,
.dropdown,
.dropleft {
  position: relative;
}

.dropdown-toggle {
  white-space: nowrap;

  // Generate the caret automatically
  @include caret;
}

// The dropdown menu
.dropdown-menu {
  position: absolute;
  top: 100%;
  left: 0;
  z-index: $zindex-dropdown;
  display: none; // none by default, but block on "open" of the menu
  float: left;
  min-width: $dropdown-min-width;
  padding: $dropdown-padding-y 0;
  margin: $dropdown-spacer 0 0; // override default ul
  @include font-size($dropdown-font-size);
  color: $dropdown-color;
  text-align: left; // Ensures proper alignment if parent has it changed (e.g., modal footer)
  list-style: none;
  background-color: $dropdown-bg;
  background-clip: padding-box;
  border: $dropdown-border-width solid $dropdown-border-color;
  @include border-radius($dropdown-border-radius);
  @include box-shadow($dropdown-box-shadow);
}

@each $breakpoint in map-keys($grid-breakpoints) {
  @include media-breakpoint-up($breakpoint) {
    $infix: breakpoint-infix($breakpoint, $grid-breakpoints);

    .dropdown-menu#{$infix}-left {
      right: auto;
      left: 0;
    }

    .dropdown-menu#{$infix}-right {
      right: 0;
      left: auto;
    }
  }
}

// Allow for dropdowns to go bottom up (aka, dropup-menu)
// Just add .dropup after the standard .dropdown class and you're set.
.dropup {
  .dropdown-menu {
    top: auto;
    bottom: 100%;
    margin-top: 0;
    margin-bottom: $dropdown-spacer;
  }

  .dropdown-toggle {
    @include caret(up);
  }
}

.dropright {
  .dropdown-menu {
    top: 0;
    right: auto;
    left: 100%;
    margin-top: 0;
    margin-left: $dropdown-spacer;
  }

  .dropdown-toggle {
    @include caret(right);
    &::after {
      vertical-align: 0;
    }
  }
}

.dropleft {
  .dropdown-menu {
    top: 0;
    right: 100%;
    left: auto;
    margin-top: 0;
    margin-right: $dropdown-spacer;
  }

  .dropdown-toggle {
    @include caret(left);
    &::before {
      vertical-align: 0;
    }
  }
}

// When enabled Popper.js, reset basic dropdown position
// stylelint-disable-next-line no-duplicate-selectors
.dropdown-menu {
  &[x-placement^="top"],
  &[x-placement^="right"],
  &[x-placement^="bottom"],
  &[x-placement^="left"] {
    right: auto;
    bottom: auto;
  }
}

// Dividers (basically an `<hr>`) within the dropdown
.dropdown-divider {
  @include nav-divider($dropdown-divider-bg, $dropdown-divider-margin-y);
}

// Links, buttons, and more within the dropdown menu
//
// `<button>`-specific styles are denoted with `// For <button>s`
.dropdown-item {
  display: block;
  width: 100%; // For `<button>`s
  padding: $dropdown-item-padding-y $dropdown-item-padding-x;
  clear: both;
  font-weight: $font-weight-normal;
  color: $dropdown-link-color;
  text-align: inherit; // For `<button>`s
  white-space: nowrap; // prevent links from randomly breaking onto new lines
  background-color: transparent; // For `<button>`s
  border: 0; // For `<button>`s

  // Prevent dropdown overflow if there's no padding
  // See https://github.com/twbs/bootstrap/pull/27703
  @if $dropdown-padding-y == 0 {
    &:first-child {
      @include border-top-radius($dropdown-inner-border-radius);
    }

    &:last-child {
      @include border-bottom-radius($dropdown-inner-border-radius);
    }
  }

  @include hover-focus {
    color: $dropdown-link-hover-color;
    text-decoration: none;
    @include gradient-bg($dropdown-link-hover-bg);
  }

  &.active,
  &:active {
    color: $dropdown-link-active-color;
    text-decoration: none;
    @include gradient-bg($dropdown-link-active-bg);
  }

  &.disabled,
  &:disabled {
    color: $dropdown-link-disabled-color;
    pointer-events: none;
    background-color: transparent;
    // Remove CSS gradients if they're enabled
    @if $enable-gradients {
      background-image: none;
    }
  }
}

.dropdown-menu.show {
  display: block;
}

// Dropdown section headers
.dropdown-header {
  display: block;
  padding: $dropdown-padding-y $dropdown-item-padding-x;
  margin-bottom: 0; // for use with heading elements
  @include font-size($font-size-sm);
  color: $dropdown-header-color;
  white-space: nowrap; // as with > li > a
}

// Dropdown text
.dropdown-item-text {
  display: block;
  padding: $dropdown-item-padding-y $dropdown-item-padding-x;
  color: $dropdown-link-color;
}

~~~

### 表单组件

form.scss:bootstrap定义的表单布局分为垂直方向的表单和水平方向的表单

~~~scss
// stylelint-disable selector-no-qualifying-type

//
// Textual form controls
//

.form-control {
  display: block;
  width: 100%;
  height: $input-height;
  padding: $input-padding-y $input-padding-x;
  font-family: $input-font-family;
  @include font-size($input-font-size);
  font-weight: $input-font-weight;
  line-height: $input-line-height;
  color: $input-color;
  background-color: $input-bg;
  background-clip: padding-box;
  border: $input-border-width solid $input-border-color;

  // Note: This has no effect on <select>s in some browsers, due to the limited stylability of `<select>`s in CSS.
  @include border-radius($input-border-radius, 0);

  @include box-shadow($input-box-shadow);
  @include transition($input-transition);

  // Unstyle the caret on `<select>`s in IE10+.
  &::-ms-expand {
    background-color: transparent;
    border: 0;
  }

  // Customize the `:focus` state to imitate native WebKit styles.
  @include form-control-focus($ignore-warning: true);

  // Placeholder
  &::placeholder {
    color: $input-placeholder-color;
    // Override Firefox's unusual default opacity; see https://github.com/twbs/bootstrap/pull/11526.
    opacity: 1;
  }

  // Disabled and read-only inputs
  //
  // HTML5 says that controls under a fieldset > legend:first-child won't be
  // disabled if the fieldset is disabled. Due to implementation difficulty, we
  // don't honor that edge case; we style them as disabled anyway.
  &:disabled,
  &[readonly] {
    background-color: $input-disabled-bg;
    // iOS fix for unreadable disabled content; see https://github.com/twbs/bootstrap/issues/11655.
    opacity: 1;
  }
}

select.form-control {
  &:focus::-ms-value {
    // Suppress the nested default white text on blue background highlight given to
    // the selected option text when the (still closed) <select> receives focus
    // in IE and (under certain conditions) Edge, as it looks bad and cannot be made to
    // match the appearance of the native widget.
    // See https://github.com/twbs/bootstrap/issues/19398.
    color: $input-color;
    background-color: $input-bg;
  }
}

// Make file inputs better match text inputs by forcing them to new lines.
.form-control-file,
.form-control-range {
  display: block;
  width: 100%;
}


//
// Labels
//

// For use with horizontal and inline forms, when you need the label (or legend)
// text to align with the form controls.
.col-form-label {
  padding-top: calc(#{$input-padding-y} + #{$input-border-width});
  padding-bottom: calc(#{$input-padding-y} + #{$input-border-width});
  margin-bottom: 0; // Override the `<label>/<legend>` default
  @include font-size(inherit); // Override the `<legend>` default
  line-height: $input-line-height;
}

.col-form-label-lg {
  padding-top: calc(#{$input-padding-y-lg} + #{$input-border-width});
  padding-bottom: calc(#{$input-padding-y-lg} + #{$input-border-width});
  @include font-size($input-font-size-lg);
  line-height: $input-line-height-lg;
}

.col-form-label-sm {
  padding-top: calc(#{$input-padding-y-sm} + #{$input-border-width});
  padding-bottom: calc(#{$input-padding-y-sm} + #{$input-border-width});
  @include font-size($input-font-size-sm);
  line-height: $input-line-height-sm;
}


// Readonly controls as plain text
//
// Apply class to a readonly input to make it appear like regular plain
// text (without any border, background color, focus indicator)

.form-control-plaintext {
  display: block;
  width: 100%;
  padding-top: $input-padding-y;
  padding-bottom: $input-padding-y;
  margin-bottom: 0; // match inputs if this class comes on inputs with default margins
  line-height: $input-line-height;
  color: $input-plaintext-color;
  background-color: transparent;
  border: solid transparent;
  border-width: $input-border-width 0;

  &.form-control-sm,
  &.form-control-lg {
    padding-right: 0;
    padding-left: 0;
  }
}


// Form control sizing
//
// Build on `.form-control` with modifier classes to decrease or increase the
// height and font-size of form controls.
//
// Repeated in `_input_group.scss` to avoid Sass extend issues.

.form-control-sm {
  height: $input-height-sm;
  padding: $input-padding-y-sm $input-padding-x-sm;
  @include font-size($input-font-size-sm);
  line-height: $input-line-height-sm;
  @include border-radius($input-border-radius-sm);
}

.form-control-lg {
  height: $input-height-lg;
  padding: $input-padding-y-lg $input-padding-x-lg;
  @include font-size($input-font-size-lg);
  line-height: $input-line-height-lg;
  @include border-radius($input-border-radius-lg);
}

// stylelint-disable-next-line no-duplicate-selectors
select.form-control {
  &[size],
  &[multiple] {
    height: auto;
  }
}

textarea.form-control {
  height: auto;
}

// Form groups
//
// Designed to help with the organization and spacing of vertical forms. For
// horizontal forms, use the predefined grid classes.

.form-group {
  margin-bottom: $form-group-margin-bottom;
}

.form-text {
  display: block;
  margin-top: $form-text-margin-top;
}


// Form grid
//
// Special replacement for our grid system's `.row` for tighter form layouts.

.form-row {
  display: flex;
  flex-wrap: wrap;
  margin-right: -$form-grid-gutter-width / 2;
  margin-left: -$form-grid-gutter-width / 2;

  > .col,
  > [class*="col-"] {
    padding-right: $form-grid-gutter-width / 2;
    padding-left: $form-grid-gutter-width / 2;
  }
}


// Checkboxes and radios
//
// Indent the labels to position radios/checkboxes as hanging controls.

.form-check {
  position: relative;
  display: block;
  padding-left: $form-check-input-gutter;
}

.form-check-input {
  position: absolute;
  margin-top: $form-check-input-margin-y;
  margin-left: -$form-check-input-gutter;

  // Use disabled attribute instead of :disabled pseudo-class
  // Workaround for: https://developer.microsoft.com/en-us/microsoft-edge/platform/issues/11295231
  &[disabled] ~ .form-check-label {
    color: $text-muted;
  }
}

.form-check-label {
  margin-bottom: 0; // Override default `<label>` bottom margin
}

.form-check-inline {
  display: inline-flex;
  align-items: center;
  padding-left: 0; // Override base .form-check
  margin-right: $form-check-inline-margin-x;

  // Undo .form-check-input defaults and add some `margin-right`.
  .form-check-input {
    position: static;
    margin-top: 0;
    margin-right: $form-check-inline-input-margin-x;
    margin-left: 0;
  }
}


// Form validation
//
// Provide feedback to users when form field values are valid or invalid. Works
// primarily for client-side validation via scoped `:invalid` and `:valid`
// pseudo-classes but also includes `.is-invalid` and `.is-valid` classes for
// server-side validation.

@each $state, $data in $form-validation-states {
  @include form-validation-state($state, map-get($data, color), map-get($data, icon));
}

// Inline forms
//
// Make forms appear inline(-block) by adding the `.form-inline` class. Inline
// forms begin stacked on extra small (mobile) devices and then go inline when
// viewports reach <768px.
//
// Requires wrapping inputs and labels with `.form-group` for proper display of
// default HTML form controls and our custom form controls (e.g., input groups).

.form-inline {
  display: flex;
  flex-flow: row wrap;
  align-items: center; // Prevent shorter elements from growing to same height as others (e.g., small buttons growing to normal sized button height)

  // Because we use flex, the initial sizing of checkboxes is collapsed and
  // doesn't occupy the full-width (which is what we want for xs grid tier),
  // so we force that here.
  .form-check {
    width: 100%;
  }

  // Kick in the inline
  @include media-breakpoint-up(sm) {
    label {
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 0;
    }

    // Inline-block all the things for "inline"
    .form-group {
      display: flex;
      flex: 0 0 auto;
      flex-flow: row wrap;
      align-items: center;
      margin-bottom: 0;
    }

    // Allow folks to *not* use `.form-group`
    .form-control {
      display: inline-block;
      width: auto; // Prevent labels from stacking above inputs in `.form-group`
      vertical-align: middle;
    }

    // Make static controls behave like regular ones
    .form-control-plaintext {
      display: inline-block;
    }

    .input-group,
    .custom-select {
      width: auto;
    }

    // Remove default margin on radios/checkboxes that were used for stacking, and
    // then undo the floating of radios and checkboxes to match.
    .form-check {
      display: flex;
      align-items: center;
      justify-content: center;
      width: auto;
      padding-left: 0;
    }
    .form-check-input {
      position: relative;
      flex-shrink: 0;
      margin-top: 0;
      margin-right: $form-check-input-margin-x;
      margin-left: 0;
    }

    .custom-control {
      align-items: center;
      justify-content: center;
    }
    .custom-control-label {
      margin-bottom: 0;
    }
  }
}

~~~

本章介绍了自定义表单组件/dropdown组件/表单组件