---
title: frontEndStudy-2
tags: HTML5,CSS3
---

## 前端进阶之路-HTML5/CSS3

### HTML5

#### 新语意标签

* `<article></article>`标签定义独立的内容；常用于论坛帖子/博客条目/用户评论；
* `<aside></aside>`定义页面内容之外的内容；
* `<audio></audio>`定义音频；常用的属性：
  * `autoplay`设置自动播放；苹果不支持；android部分浏览器支持；
  * `controls`显示音频播放控件
  * `loop`定义音频播放结束后重新开始播放
  * `preload`音频在页面加载时进行加载并预备播放；如果使用`autoplay`属性则忽略该属性；
  * `src`要播放的音频的URL
* `canvas`定义图形；标签只是容器；需要使用脚本绘制图形
* `<progress></progress>`定义任务的进度条；通过属性`max`和`value`来配合实现进度的加载
* 定义布局的`<header></header>/<nav></nav>/<section></section>/<footer></footer>`
* `<video></video>`引入视频；属性同音频属性相同

#### 表单

HTML5拥有多个新的表单输入类型；通过属性`type`提交表单时会自动验证输入信息；常用的input输入类型有：

* email
* url
* number；可以通过设置属性对数字类型进行限定：`max/min/step/value`
* `range`类型显示为滑动条
* search。用于搜索域；显示为常规文本域

#### 音频和视频

网页上播放音视频是通过HTML5新增的`<video></video>`和`<audio></audio>`标签实现的；

* 判断浏览器支持性：

  ~~~js
   //    判断浏览器是否支持audio或者video元素最简单的办法是用脚本动态创建它，然后检测特定的函数是否存在
          var hasVideo = !!(document.createElement('video').canPlayType);
  ~~~

* js中控制音频或者视频的内置方法

  ~~~js
  　　　　　　load() 　　　　　　　加载音频或者视频文件，为播放做准备。通常情况下不需要调用，除非是动态创建的的元素，用来在在播放前加载
          　play() 　　　　　　　加载（如果还未加载完成）并播放音频或视频文件，除非音频或视频已经暂停在其他位置了，否则从头开始
         　 pause() 　　　　　　 暂停处于播放的视频或者音频文件
          　canPlayType(type)  试video元素是否支持给定MIME类型的文件
  ~~~

* js中控制音频或者视频的内置只读属性

  ~~~js
  duration    整个媒体文件的播放时长，以s为单位，如果无法获取时长返回NaN
          paused        如果媒体文件当前被暂停，则返回true,如果还未开始播放也返回true
          ended        如果媒体文件已经播放完毕。返回true
          startTime    返回最早的播放起始时间，一般是0.0，除非是从缓冲过的文件，并且一部分已经不在缓冲区了！
          error        在发生错误的时候返回的错误代码
          currentSrc    以字符串的形式返回当前正在播放的或已经加载的文件，对应于浏览器就是source选择的文件
  ~~~

* js中可被脚本修改并影响播放的部分媒体元素的属性

  ~~~
  autoplay        将媒体文件设置为创建后自动播放，或者查询是否已经设置autoplay
          loop            如果媒体文件已经播放完毕后能重新播放则返回true,或者媒体将媒体文件设置为循环播放
          currentTime        以s为单位返回从开始播放到现在所用的时间，在播放过程中，设置currentTime来进行搜索，并定位到媒体文件特定的位置
          controls        显示或隐藏用户控制界面，或者查询用户控制界面当前是否可见
          volume            在0.0到1.0之前设置音频音量的值，或者查询当前音量的相对值
          muted            为音频文件设置静音或者消除静音，或者检测当前是否为静音
          autobuffer        通知播放器在媒体文件开始播放前是否进行缓冲加载，如果媒体文件设置autoplay,则忽略该属性
  ~~~

* video元素的额外特性

  ~~~
  　poster                    在视频加载完成之前，代表视频内容的图片的url地址，该属性可读可写，可以随意修改
          width,height             取或设置显示的尺寸。如果设置的宽度与视频本身大小不匹配，可能导致四周会出现黑色区域
          videoWidth,videoHeight   返回视频固有的宽度和高度，只读
  ~~~

#### 离线和本地存储

**离线存储**：离线存储需要配置`.manifest`文件；然后在页面头部加入；

~~~html
<!DOCTYPE HTML>
<html manifest = "cache.manifest">
...
</html>
~~~

cache.manifest文件配置

~~~
CACHE MANIFEST
#v0.11

CACHE:

js/app.js
css/style.css

NETWORK:
resourse/logo.png

FALLBACK:
/ /offline.html
~~~

manifest文件一般由三部分组成：

* CACHE:表示需要离线存储的资源列表；由于包含manifest文件的页面将被自动离线存储；所以不需要把页面自身也列出来
* NETWORK:表示在它下面列出来的资源只有在在线的情况下才能访问，他们不会被离线存储，所以在离线情况下无法使用这些资源。不过，如果在CACHE和NETWORK中有一个相同的资源，那么这个资源还是会被离线存储，也就是说CACHE的优先级更高。
* FALLBACK:表示如果访问第一个资源失败，那么就使用第二个资源来替换他，比如上面这个文件表示的就是如果访问根目录下任何一个资源失败了，那么就去访问offline.html。

**浏览器解析manifest文件**

1. 在线状态：
   * 首次访问app；浏览器根据manifest文件配置下载相应的资源并存储
   * 非首次访问；浏览器优先使用离线资源加载页面；然后浏览器会对比新旧manifest文件；如果发生改变；浏览器会重新下载文件中的资源并存储；
2. 离线状态：浏览器直接使用离线存储的资源；

**使用manifest文件的几个问题**

* 如果服务器对离线的资源进行了更新，那么必须更新manifest文件之后这些资源才能被浏览器重新下载，如果只是更新了资源而没有更新manifest文件的话，浏览器并不会重新下载资源，也就是说还是使用原来离线存储的资源。
* 对于manifest文件进行缓存的时候需要十分小心，因为可能出现一种情况就是你对manifest文件进行了更新，但是http的缓存规则告诉浏览器本地缓存的manifest文件还没过期，这个情况下浏览器还是使用原来的manifest文件，所以对于manifest文件最好不要设置缓存。
* 浏览器在下载manifest文件中的资源的时候，它会一次性下载所有资源，如果某个资源由于某种原因下载失败，那么这次的所有更新就算是失败的，浏览器还是会使用原来的资源。
* 在更新了资源之后，新的资源需要到下次再打开app才会生效，如果需要资源马上就能生效，那么可以使用`window.applicationCache.swapCache()`方法来使之生效，出现这种现象的原因是浏览器会先使用离线资源加载页面，然后再去检查manifest是否有更新，所以需要到下次打开页面才能生效。

**本地存储**：常用的三种存储方式及方法

**cookie：**

1. 最大支持4096字节；

2. Cookie默认情况都会随着Http请求发送到后台服务器，但并不是所有请求都需要Cookie的，比如：js、css、图片等请求则不需要cookie。

   ~~~js
   //设置cookie
   /**
    * 
    * @desc  设置Cookie
    * @param {String} name 
    * @param {String} value 
    * @param {Number} days 
    */
   function setCookie(name, value, days) {
       var date = new Date();
       date.setDate(date.getDate() + days);
       document.cookie = name + '=' + value + ';expires=' + date;
   }
   //获取cookie
   function getCookie(name) {
       var arr = document.cookie.replace(/\s/g, "").split(';');
       for (var i = 0; i < arr.length; i++) {
           var tempArr = arr[i].split('=');
           if (tempArr[0] == name) {
               return decodeURIComponent(tempArr[1]);
           }
       }
       return '';
   }
   //根据name删除cookie
   var setCookie = require('./setCookie');
   /**
    * 
    * @desc 根据name删除cookie
    * @param  {String} name 
    */
   function removeCookie(name) {
       // 设置已过期，系统会立刻删除cookie
       setCookie(name, '1', -1);
   }
   ~~~

**会话级别的本地存储：sessionStorage**;数据是以key-value形式存储的；与浏览器当前会话相关；会话结束后数据自动清除；sessionStorage提供四个方法辅助我们进行本地存储的相关操作；

~~~js
 //添加key-value 数据到 sessionStorage
 sessionStorage.setItem("demokey", "http://blog.itjeek.com");
 //通过key来获取value
 var dt = sessionStorage.getItem("demokey");
// 删除某一条目存储
sessionStorage.removeItem(key)

 //清空所有的key-value数据。
 //sessionStorage.clear();
~~~

**永久本地存储：localStorage**；操作方式同sessionStorage相同；API需要改成localStorage

**本地数据库；后边学习到了再补充**

#### svg

svg是指可伸缩矢量图形，定于用于网络的基于矢量的图形；使用xml格式定义图形



