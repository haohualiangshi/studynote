---
title: note_taking_01
date: 2017-07-10 15:50:27
tags: [blob]
categories: 随手笔记
---

### 关于blob类型的理解

想下载一个视频时发现是个blob:src形式；不明白这个是个什么鬼，以下是搜索学习的总结

1.   参考网址：https://creamidea.github.io/static/html/articles/HTML5-Video-Blob.html  。先来段代码熟悉下意思

     ~~~javascript
     var video=document.querySelector('video');
     var mediaSource=new MdeiaSource;
     video.Src=URL.createObjectURL(mediaSource);
     mediaSource.addEventListener('sourceopen',sourceOpen);
     function sourceOpen(){
       var mediaSource=this;
       var sourceBuffer = mediaSource.addSourceBuffer('video/mp4';codecs="avc1.42E01E,mp4a.40.2");
     sourceBuffer.addEventListener('updateend',function(){
       mediaSource.endOfStream();
       video.play();
     })
     sourceBuffer.appendBuffer(buf);// buf is the arraybuffer to store the video data
     }
     ~~~

     代码解析：创建变量名为video的DOM对象，创建变量名为mediaSource的MediaSource对象。通过函数createObjectURL将video对象的src和mediaSource进行连接，然后通过注册事件event::sourceopen来触发当前连接之后的的回调处理；回调处理就是需要赋值视频数据的地方，调用MediaSourceBuffer::addSourceBuffer方法来构建一个存放视频数据的Buffer；在往buffer中存放数据结束后触发事件updateend。然后调用play函数通知浏览器播放视频

2.   MediaSource :mediaSource是Media Source Extensions API表示媒体资源HTMLMediaElement对象的接口。MediaSource对象可以附着在HTMLMediaElement在客户端进行播放。
     参考网址：https://developer.mozilla.org/zh-CN/docs/Web/API/MediaSource

     MediaSource属性：

     1.   MediaSource.sourceBuffers:**只读** ，返回一个SourceBufferList对象，包含了SourceBuffer的列表object associated with this MediaSource.
     2.   MediaSource.activeSourceBuffer:**只读** 
     3.   MediaSource.readyState:只读
     4.   mediaSource.duration

     方法：

     1.   addSourceBuffer():该事件是在触发sourceopen监听时进行的，该动作会创建一个sourceBuffer对象用于数据流的播放处理。如果mediaSource对象无法触发该事件；则无法通过该扩展进行播放的。
     2.   removeSourceBuffer():
     3.   endOfStream()

3.   MediaSource接口的使用：

     参考网址：http://chenzhaofei.lofter.com/post/1d03c1b7_58d8a79

     1.   判断是否mediaSource的扩展类，该语句决定了整个播放方式是否可以使用MediaSource接口控制播放器。

          ~~~javascript
          window.MediaSource = window.MediaSource || window.WebkitMediaSource;
          ~~~

     2.   isTypeSupporteed:判断是否支持要解码播放的视频文件编码和类型。

          ~~~javascript
          MediaSource.isTypeSupported('video/webm;codecs="vorbis,vp8"');//是否支持webm
          MediaSource.isTypeSupported('video/mp4;codecs="avc1.42E01E,mp4a.40.2"')//是否支持MP4
          MediaSource.isTypeSupported('video/mp2t;codes="avc1.42E01E,mp4a.40.2"')//是否支持ts
          ~~~

     3.   addSourceBuffer

          ~~~javascript
          mediaSource.addSourceBuffer('video/mp4;codecs="avc1.42E01E,mp4a.40.2"')
          ~~~

     4.   appendBuffer:sourceBuffer对象的方法，用于持续数据的添加播放

          ~~~javascript
          sourceBuffer.appendBuffer(Uint8array);//媒体二进制数据
          ~~~

     5.   buffered: 类型为TimeRanges，描述了添加进去的所有媒体数据的range信息。为一个数组，里边标示了持续或间断的时间信息列表

          ~~~javascript
          for(var i=0;i<buffered.length;i++){
            start=buffered.start(i)//第i个range信息的开始时间
            end=buffered.end(i);//第i个range信息的结束时间
          }
          ~~~

          如果播放的媒体数据是连续的；则只有一个开始时间点和一个结束时间点。所以如果要计算缓冲中还存在多少时间则可以通过该描述信息与当前播放时间点进行换算

          ~~~javascript
          function play(){
            if(!this.mediaSource){
              this.mediaSource=new MediaSource();
              var me=this;
              this.mediaSource.addEventListener("sourceopen",function(){
                me.onMediaSourceOpen();
              });
              this.mediaSource.addEventListener("sourceended",function(){
                me.onMediaSourceEnded();
              });
              this.mediaSource.addEventListener('sourceclose',function(){
                me.onMediaSourceClose();
              });
              this.mediaSource.addEventListener("error",function(){
                me.onUpdataError();
              });
              this.video=this.createNewVideo();
              this.video.src=window.URL.createObjectURL(this.mediaSource);
              this.video.play();
            }
            if(!this.sourceBuffer){
              return ;
            }
            if(this.sourceBuffer.updating){
              return;//上一块数据还在添加中
            }
            try{
              this.sourceBuffer.appendBuffer(dataBytes);//添加数据
            }catch(err){}
          }
            function createNewVideo(){
              var newVideo=document.createElement("video");
              newVideo.id="player";
              newVideo.width=this.videoWidth;
              newVideo.height=this.videoHeight;
              return newVideo;
            }
            //事件侦听
            onMediaSourceOpen:function(){
              //DOMString可以通过转码获得
              var typeNmae='video/mp4;codecs="avc1.42E01E,mp4a.40.2"';
              var issurpport=MediaSource.isTypeSupported(typeName);
              this.mediaSource.duration=this.totalDuration;//设置视频总时长
              this.sourceBuffer=this.mediaSource.addSourceBuffer(typeName);
            }
            onMediaSourceEnded:function(){
              console.log("source ended");
            }
            onMediaSourceClosed:function(){
              console.log("cource close");
            }
          }
          ~~~

4.   以下是自己做的一个demo；MP4格式的文件未成功；webm格式的成功了；但是不能跨越

     ~~~
     <!DOCTYPE html>
     <html>

     	<head>
     		<meta charset="UTF-8">
     		<title>blob</title>
     	</head>

     	<body>
     		<video id="video" controls="controls"></video>
     		<script type="text/javascript">
     			var video = document.querySelector('video');
     			var assetURL = 'http://172.16.70.106:8020/Demo/Demo1/audio/test2.webm';
     			// Need to be specific for Blink regarding codecs
     			// ./mp4info frag_bunny.mp4 | grep Codec
     			var mimeCodec = 'video/webm;codecs="vorbis,vp8"';

     			if('MediaSource' in window && MediaSource.isTypeSupported(mimeCodec)) {
     				var mediaSource = new MediaSource();
     				video.src = URL.createObjectURL(mediaSource);
     				mediaSource.addEventListener('sourceopen', sourceOpen);
     				
     			} else {
     				console.error('Unsupported MIME type or codec: ', mimeCodec);
     			}

     			function sourceOpen() {
     				console.log(this); // open
     				var mediaSource = this;
     				var sourceBuffer = mediaSource.addSourceBuffer(mimeCodec);
     				fetchAB(assetURL, function(buf) {
     					console.log(buf)
     					console.log(sourceBuffer);
     					sourceBuffer.addEventListener('updateend', function() {
     						console.log(mediaSource);
     						mediaSource.endOfStream();
     						
     						video.play();
     						console.log(mediaSource.readyState); // ended
     					});
     					sourceBuffer.appendBuffer(buf);
     				});
     			};
     			function fetchAB(url, cb) {
     				console.log(url);
     				var xhr = new XMLHttpRequest;
     				xhr.open('get', url);
     				xhr.responseType = 'arraybuffer';
     				xhr.onload = function() {
     					console.log(xhr.response);
     					cb(xhr.response);
     				};
     				xhr.send();
     			};
     		</script>
     	</body>
     </html>
     ~~~

