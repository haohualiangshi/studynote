---
title: 前端进阶之路-webSocket
tags: webSocket
date: 2019-05-07 13:58:27
---


**webSocket**是HTML5提供的一种在单个TCP连接上进行全双工通讯的协议；webSocket使得客户端与服务器之间的数据交换变得更加简单，允许服务端主动向客户端推送数据。在webSocket API中；浏览器和服务器只需完成一次握手；两者之间就直接可以创建持久性的链接；并进行双向数据传输。

### webSocket属性

| 属性                  | 描述                                                         |
| --------------------- | ------------------------------------------------------------ |
| Socket.readyState     | 只读属性readyState表示链接状态，状态值有：0-表示连接尚未建立；1-表示连接已经建立；可以进行通讯；2-表示链接正在进行关闭；3-表示链接已经关闭或者链接不能打开 |
| Socket.bufferedAmount | 只读属性bufferedAmount已被send()放入队列中等待传输；         |

#### WebSocket事件

| 事件    | 事件处理程序     | 描述                       |
| ------- | ---------------- | -------------------------- |
| open    | Socket.onopen    | 连接建立时出发             |
| message | Socket.onmessage | 客户端接收服务端数据时触发 |
| error   | Socket.onerror   | 通信发生错误时触发         |
| Close   | Socket.onclose   | 链接关闭时触发             |

#### webSocket方法

| 方法    | 描述             |
| ------- | ---------------- |
| send()  | 使用链接发送数据 |
| close() | 关闭链接         |

 Demo ：参考教程https://www.runoob.com/html/html5-websocket.html

