---
title: 前端页面meta标签设置缓存
tags: 前端缓存
---

配合客户端写的网页；客户端需求是无网络的情况下要使用缓存的网页；但是发现服务端更新完文件后并且ETag值发生了更改但是前端页面并没有更新；废话不说；先走代码；该代码是让客户端在有网络的情况下每次校验服务端是否发生更改；

~~~html
<meta http-equiv="Cache-control" content="no-cache,max-age=0, must-revalidate,no-store">
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <meta http-equiv="Cache" content="no-cache">
~~~

## 浏览器的缓存机制

1. 当前缓存的文件是否过期；
2. 服务器中文件是否有改动

## 判断缓存过期以及文件的变动

文件变动后文件的Etag值会发生更改；客户端先问服务器Etag值是否发生更改；然后决定是否更新当前文件；

#### 设置过期,在请求头中设置字段

##### Http1.0

1. `Pragma`:它用来向后兼容只支持 HTTP/1.0 协议的缓存服务器，那时候 HTTP/1.1 协议中的 Cache-Control 还没有出来

##### Http1.1

1. Expires:相应头过期时间；Cache-control中设置max-age;则该属性会被忽略
2. Cache-control;该字段的优先级要比Expires优先级高

#### Cacha-control常见的取值：

* `no-chche`:表示无论服务端有没有设置Cache-control,都必须重新追根到源服务器进行校验，源服务器未变化返回304；

* `must-revalidate`:告诉浏览器/缓存服务器；在本地文件过期之前可以使用本地文件；本地文件一旦过期需要去源服务器进行有效性校验；如果有缓存服务器且该资源未过有效期则命中缓存服务器并返回200；如果过期切源服务器未发生更改；则教研后返回304；

* `max-age`:缓存的内容将在多少秒后失效,相对于请求时间来说的；`max-age=0`便是无论服务端如何设置；在重新获取资源之前；先检验ETag/Last-Modified;在设置max-age=0或no-cache后；在资源无更新的情况下访问都会返回304

* `private`:客户端可以缓存

* `public`:客户端和代理服务器都可缓存

  