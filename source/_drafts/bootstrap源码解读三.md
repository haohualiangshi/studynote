---
title: bootstrap源码解读三
tags: bootstrap-css源码解读
---

### 网格系统

grid.scss：bootstrap将网格系统分为12列；网格系统有一下5类：

* .col-num 针对所有设备
* .col-sm-num 平板-屏幕宽度等于或者大于576px
* .col-md-num 桌面显示器，屏幕宽度等于或者大于768px
* .col-lg-num 大桌面显示器，屏幕宽度等于或大于992
* .col-xl-num 超大屏幕显示器，屏幕宽度等于或者大于1200px

~~~scss
// Container widths
//
// Set the container width, and override it for fixed navbars in media queries.

@if $enable-grid-classes {
  .container {
    @include make-container();
    @include make-container-max-widths();
  }
}

// Fluid container
//
// Utilizes the mixin meant for fixed width containers, but with 100% width for
// fluid, full width layouts.

@if $enable-grid-classes {
  .container-fluid {
    @include make-container();
  }
}

// Row
//
// Rows contain and clear the floats of your columns.

@if $enable-grid-classes {
  .row {
    @include make-row();
  }

  // Remove the negative margin from default .row, then the horizontal padding
  // from all immediate children columns (to prevent runaway style inheritance).
  .no-gutters {
    margin-right: 0;
    margin-left: 0;

    > .col,
    > [class*="col-"] {
      padding-right: 0;
      padding-left: 0;
    }
  }
}

// Columns
//
// Common styles for small and large grid columns

@if $enable-grid-classes {
  @include make-grid-columns();
}

~~~

### 图像形状

Images.scss:`.rounded`类可以让图片显示圆角效果；`.rounded-circle`类可以设置成椭圆型图片；`.img-thumbnail`类用于设置图片缩略图，图片有边框；`.float-right`和`.float-left`可以设置图片的对齐方式；`.img-fluid`类设置响应式图片

~~~scss
.img-fluid {
  @include img-fluid;
}


// Image thumbnails
.img-thumbnail {
  padding: $thumbnail-padding;
  background-color: $thumbnail-bg;
  border: $thumbnail-border-width solid $thumbnail-border-color;
  @include border-radius($thumbnail-border-radius);
  @include box-shadow($thumbnail-box-shadow);

  // Keep them at most 100% wide
  @include img-fluid;
}

//
// Figures
//

.figure {
  // Ensures the caption's text aligns with the image.
  display: inline-block;
}

.figure-img {
  margin-bottom: $spacer / 2;
  line-height: 1;
}

.figure-caption {
  @include font-size($figure-caption-font-size);
  color: $figure-caption-color;
}
~~~

### 输入框组

Input-group:`.input-group`类可以向表单中添加更多的样式；使用`.input-group-prepend`类可以在输入框的前面添加文本信息；`.input-group-append`类在输入框的后边添加文本信息；我们还可以使用`.input-group-text`类设置文本样式

~~~scss
.input-group {
  position: relative;
  display: flex;
  flex-wrap: wrap; // For form validation feedback
  align-items: stretch;
  width: 100%;

  > .form-control,
  > .form-control-plaintext,
  > .custom-select,
  > .custom-file {
    position: relative; // For focus state's z-index
    flex: 1 1 auto;
    // Add width 1% and flex-basis auto to ensure that button will not wrap out
    // the column. Applies to IE Edge+ and Firefox. Chrome does not require this.
    width: 1%;
    margin-bottom: 0;

    + .form-control,
    + .custom-select,
    + .custom-file {
      margin-left: -$input-border-width;
    }
  }

  // Bring the "active" form control to the top of surrounding elements
  > .form-control:focus,
  > .custom-select:focus,
  > .custom-file .custom-file-input:focus ~ .custom-file-label {
    z-index: 3;
  }

  // Bring the custom file input above the label
  > .custom-file .custom-file-input:focus {
    z-index: 4;
  }

  > .form-control,
  > .custom-select {
    &:not(:last-child) { @include border-right-radius(0); }
    &:not(:first-child) { @include border-left-radius(0); }
  }

  // Custom file inputs have more complex markup, thus requiring different
  // border-radius overrides.
  > .custom-file {
    display: flex;
    align-items: center;

    &:not(:last-child) .custom-file-label,
    &:not(:last-child) .custom-file-label::after { @include border-right-radius(0); }
    &:not(:first-child) .custom-file-label { @include border-left-radius(0); }
  }
}


// Prepend and append
//
// While it requires one extra layer of HTML for each, dedicated prepend and
// append elements allow us to 1) be less clever, 2) simplify our selectors, and
// 3) support HTML5 form validation.

.input-group-prepend,
.input-group-append {
  display: flex;

  // Ensure buttons are always above inputs for more visually pleasing borders.
  // This isn't needed for `.input-group-text` since it shares the same border-color
  // as our inputs.
  .btn {
    position: relative;
    z-index: 2;

    &:focus {
      z-index: 3;
    }
  }

  .btn + .btn,
  .btn + .input-group-text,
  .input-group-text + .input-group-text,
  .input-group-text + .btn {
    margin-left: -$input-border-width;
  }
}

.input-group-prepend { margin-right: -$input-border-width; }
.input-group-append { margin-left: -$input-border-width; }


// Textual addons
//
// Serves as a catch-all element for any text or radio/checkbox input you wish
// to prepend or append to an input.

.input-group-text {
  display: flex;
  align-items: center;
  padding: $input-padding-y $input-padding-x;
  margin-bottom: 0; // Allow use of <label> elements by overriding our default margin-bottom
  @include font-size($input-font-size); // Match inputs
  font-weight: $font-weight-normal;
  line-height: $input-line-height;
  color: $input-group-addon-color;
  text-align: center;
  white-space: nowrap;
  background-color: $input-group-addon-bg;
  border: $input-border-width solid $input-group-addon-border-color;
  @include border-radius($input-border-radius);

  // Nuke default margins from checkboxes and radios to vertically center within.
  input[type="radio"],
  input[type="checkbox"] {
    margin-top: 0;
  }
}


// Sizing
//
// Remix the default form control sizing classes into new ones for easier
// manipulation.

.input-group-lg > .form-control:not(textarea),
.input-group-lg > .custom-select {
  height: $input-height-lg;
}

.input-group-lg > .form-control,
.input-group-lg > .custom-select,
.input-group-lg > .input-group-prepend > .input-group-text,
.input-group-lg > .input-group-append > .input-group-text,
.input-group-lg > .input-group-prepend > .btn,
.input-group-lg > .input-group-append > .btn {
  padding: $input-padding-y-lg $input-padding-x-lg;
  @include font-size($input-font-size-lg);
  line-height: $input-line-height-lg;
  @include border-radius($input-border-radius-lg);
}

.input-group-sm > .form-control:not(textarea),
.input-group-sm > .custom-select {
  height: $input-height-sm;
}

.input-group-sm > .form-control,
.input-group-sm > .custom-select,
.input-group-sm > .input-group-prepend > .input-group-text,
.input-group-sm > .input-group-append > .input-group-text,
.input-group-sm > .input-group-prepend > .btn,
.input-group-sm > .input-group-append > .btn {
  padding: $input-padding-y-sm $input-padding-x-sm;
  @include font-size($input-font-size-sm);
  line-height: $input-line-height-sm;
  @include border-radius($input-border-radius-sm);
}

.input-group-lg > .custom-select,
.input-group-sm > .custom-select {
  padding-right: $custom-select-padding-x + $custom-select-indicator-padding;
}


// Prepend and append rounded corners
//
// These rulesets must come after the sizing ones to properly override sm and lg
// border-radius values when extending. They're more specific than we'd like
// with the `.input-group >` part, but without it, we cannot override the sizing.


.input-group > .input-group-prepend > .btn,
.input-group > .input-group-prepend > .input-group-text,
.input-group > .input-group-append:not(:last-child) > .btn,
.input-group > .input-group-append:not(:last-child) > .input-group-text,
.input-group > .input-group-append:last-child > .btn:not(:last-child):not(.dropdown-toggle),
.input-group > .input-group-append:last-child > .input-group-text:not(:last-child) {
  @include border-right-radius(0);
}

.input-group > .input-group-append > .btn,
.input-group > .input-group-append > .input-group-text,
.input-group > .input-group-prepend:not(:first-child) > .btn,
.input-group > .input-group-prepend:not(:first-child) > .input-group-text,
.input-group > .input-group-prepend:first-child > .btn:not(:first-child),
.input-group > .input-group-prepend:first-child > .input-group-text:not(:first-child) {
  @include border-left-radius(0);
}
~~~

### 列表组

list-group：通过`.list-group`类和`.list-group-item`实现列表组的排版布局

~~~scss

.list-group {
  display: flex;
  flex-direction: column;

  // No need to set list-style: none; since .list-group-item is block level
  padding-left: 0; // reset padding because ul and ol
  margin-bottom: 0;
}


// Interactive list items
//
// Use anchor or button elements instead of `li`s or `div`s to create interactive
// list items. Includes an extra `.active` modifier class for selected items.

.list-group-item-action {
  width: 100%; // For `<button>`s (anchors become 100% by default though)
  color: $list-group-action-color;
  text-align: inherit; // For `<button>`s (anchors inherit)

  // Hover state
  @include hover-focus {
    z-index: 1; // Place hover/focus items above their siblings for proper border styling
    color: $list-group-action-hover-color;
    text-decoration: none;
    background-color: $list-group-hover-bg;
  }

  &:active {
    color: $list-group-action-active-color;
    background-color: $list-group-action-active-bg;
  }
}


// Individual list items
//
// Use on `li`s or `div`s within the `.list-group` parent.

.list-group-item {
  position: relative;
  display: block;
  padding: $list-group-item-padding-y $list-group-item-padding-x;
  // Place the border on the list items and negative margin up for better styling
  margin-bottom: -$list-group-border-width;
  color: $list-group-color;
  background-color: $list-group-bg;
  border: $list-group-border-width solid $list-group-border-color;

  &:first-child {
    @include border-top-radius($list-group-border-radius);
  }

  &:last-child {
    margin-bottom: 0;
    @include border-bottom-radius($list-group-border-radius);
  }

  &.disabled,
  &:disabled {
    color: $list-group-disabled-color;
    pointer-events: none;
    background-color: $list-group-disabled-bg;
  }

  // Include both here for `<a>`s and `<button>`s
  &.active {
    z-index: 2; // Place active items above their siblings for proper border styling
    color: $list-group-active-color;
    background-color: $list-group-active-bg;
    border-color: $list-group-active-border-color;
  }
}


// Horizontal
//
// Change the layout of list group items from vertical (default) to horizontal.

@each $breakpoint in map-keys($grid-breakpoints) {
  @include media-breakpoint-up($breakpoint) {
    $infix: breakpoint-infix($breakpoint, $grid-breakpoints);

    .list-group-horizontal#{$infix} {
      flex-direction: row;

      .list-group-item {
        margin-right: -$list-group-border-width;
        margin-bottom: 0;

        &:first-child {
          @include border-left-radius($list-group-border-radius);
          @include border-top-right-radius(0);
        }

        &:last-child {
          margin-right: 0;
          @include border-right-radius($list-group-border-radius);
          @include border-bottom-left-radius(0);
        }
      }
    }
  }
}


// Flush list items
//
// Remove borders and border-radius to keep list group items edge-to-edge. Most
// useful within other components (e.g., cards).

.list-group-flush {
  .list-group-item {
    border-right: 0;
    border-left: 0;
    @include border-radius(0);

    &:last-child {
      margin-bottom: -$list-group-border-width;
    }
  }

  &:first-child {
    .list-group-item:first-child {
      border-top: 0;
    }
  }

  &:last-child {
    .list-group-item:last-child {
      margin-bottom: 0;
      border-bottom: 0;
    }
  }
}


// Contextual variants
//
// Add modifier classes to change text and background color on individual items.
// Organizationally, this must come after the `:hover` states.

@each $color, $value in $theme-colors {
  @include list-group-item-variant($color, theme-color-level($color, -9), theme-color-level($color, 6));
}
~~~

### 模态框

modal.scss:模态框事覆盖在父窗体上的子窗体

~~~scss
// .modal-open      - body class for killing the scroll
// .modal           - container to scroll within
// .modal-dialog    - positioning shell for the actual modal
// .modal-content   - actual modal w/ bg and corners and stuff


.modal-open {
  // Kill the scroll on the body
  overflow: hidden;

  .modal {
    overflow-x: hidden;
    overflow-y: auto;
  }
}

// Container that the modal scrolls within
.modal {
  position: fixed;
  top: 0;
  left: 0;
  z-index: $zindex-modal;
  display: none;
  width: 100%;
  height: 100%;
  overflow: hidden;
  // Prevent Chrome on Windows from adding a focus outline. For details, see
  // https://github.com/twbs/bootstrap/pull/10951.
  outline: 0;
  // We deliberately don't use `-webkit-overflow-scrolling: touch;` due to a
  // gnarly iOS Safari bug: https://bugs.webkit.org/show_bug.cgi?id=158342
  // See also https://github.com/twbs/bootstrap/issues/17695
}

// Shell div to position the modal with bottom padding
.modal-dialog {
  position: relative;
  width: auto;
  margin: $modal-dialog-margin;
  // allow clicks to pass through for custom click handling to close modal
  pointer-events: none;

  // When fading in the modal, animate it to slide down
  .modal.fade & {
    @include transition($modal-transition);
    transform: $modal-fade-transform;
  }
  .modal.show & {
    transform: $modal-show-transform;
  }
}

.modal-dialog-scrollable {
  display: flex; // IE10/11
  max-height: calc(100% - #{$modal-dialog-margin * 2});

  .modal-content {
    max-height: calc(100vh - #{$modal-dialog-margin * 2}); // IE10/11
    overflow: hidden;
  }

  .modal-header,
  .modal-footer {
    flex-shrink: 0;
  }

  .modal-body {
    overflow-y: auto;
  }
}

.modal-dialog-centered {
  display: flex;
  align-items: center;
  min-height: calc(100% - #{$modal-dialog-margin * 2});

  // Ensure `modal-dialog-centered` extends the full height of the view (IE10/11)
  &::before {
    display: block; // IE10
    height: calc(100vh - #{$modal-dialog-margin * 2});
    content: "";
  }

  // Ensure `.modal-body` shows scrollbar (IE10/11)
  &.modal-dialog-scrollable {
    flex-direction: column;
    justify-content: center;
    height: 100%;

    .modal-content {
      max-height: none;
    }

    &::before {
      content: none;
    }
  }
}

// Actual modal
.modal-content {
  position: relative;
  display: flex;
  flex-direction: column;
  width: 100%; // Ensure `.modal-content` extends the full width of the parent `.modal-dialog`
  // counteract the pointer-events: none; in the .modal-dialog
  color: $modal-content-color;
  pointer-events: auto;
  background-color: $modal-content-bg;
  background-clip: padding-box;
  border: $modal-content-border-width solid $modal-content-border-color;
  @include border-radius($modal-content-border-radius);
  @include box-shadow($modal-content-box-shadow-xs);
  // Remove focus outline from opened modal
  outline: 0;
}

// Modal background
.modal-backdrop {
  position: fixed;
  top: 0;
  left: 0;
  z-index: $zindex-modal-backdrop;
  width: 100vw;
  height: 100vh;
  background-color: $modal-backdrop-bg;

  // Fade for backdrop
  &.fade { opacity: 0; }
  &.show { opacity: $modal-backdrop-opacity; }
}

// Modal header
// Top section of the modal w/ title and dismiss
.modal-header {
  display: flex;
  align-items: flex-start; // so the close btn always stays on the upper right corner
  justify-content: space-between; // Put modal header elements (title and dismiss) on opposite ends
  padding: $modal-header-padding;
  border-bottom: $modal-header-border-width solid $modal-header-border-color;
  @include border-top-radius($modal-content-border-radius);

  .close {
    padding: $modal-header-padding;
    // auto on the left force icon to the right even when there is no .modal-title
    margin: (-$modal-header-padding-y) (-$modal-header-padding-x) (-$modal-header-padding-y) auto;
  }
}

// Title text within header
.modal-title {
  margin-bottom: 0;
  line-height: $modal-title-line-height;
}

// Modal body
// Where all modal content resides (sibling of .modal-header and .modal-footer)
.modal-body {
  position: relative;
  // Enable `flex-grow: 1` so that the body take up as much space as possible
  // when should there be a fixed height on `.modal-dialog`.
  flex: 1 1 auto;
  padding: $modal-inner-padding;
}

// Footer (for actions)
.modal-footer {
  display: flex;
  align-items: center; // vertically center
  justify-content: flex-end; // Right align buttons with flex property because text-align doesn't work on flex items
  padding: $modal-inner-padding;
  border-top: $modal-footer-border-width solid $modal-footer-border-color;
  @include border-bottom-radius($modal-content-border-radius);

  // Easily place margin between footer elements
  > :not(:first-child) { margin-left: .25rem; }
  > :not(:last-child) { margin-right: .25rem; }
}

// Measure scrollbar width for padding body during modal show/hide
.modal-scrollbar-measure {
  position: absolute;
  top: -9999px;
  width: 50px;
  height: 50px;
  overflow: scroll;
}

// Scale up the modal
@include media-breakpoint-up(sm) {
  // Automatically set modal's width for larger viewports
  .modal-dialog {
    max-width: $modal-md;
    margin: $modal-dialog-margin-y-sm-up auto;
  }

  .modal-dialog-scrollable {
    max-height: calc(100% - #{$modal-dialog-margin-y-sm-up * 2});

    .modal-content {
      max-height: calc(100vh - #{$modal-dialog-margin-y-sm-up * 2});
    }
  }

  .modal-dialog-centered {
    min-height: calc(100% - #{$modal-dialog-margin-y-sm-up * 2});

    &::before {
      height: calc(100vh - #{$modal-dialog-margin-y-sm-up * 2});
    }
  }

  .modal-content {
    @include box-shadow($modal-content-box-shadow-sm-up);
  }

  .modal-sm { max-width: $modal-sm; }
}

@include media-breakpoint-up(lg) {
  .modal-lg,
  .modal-xl {
    max-width: $modal-lg;
  }
}

@include media-breakpoint-up(xl) {
  .modal-xl { max-width: $modal-xl; }
}

~~~

本章总结了网格系统grid/图片样式images/列表组list-group/模态框modal