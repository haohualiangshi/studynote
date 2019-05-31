---
title: Velocity使用
tags: velocity
---

velocity是一个加速js动画库；可依赖zepto和jq；也可以单独使用；具有色彩动画/变换/循环/缓动/SVG支持/滚动。兼容性：V1版本能够兼容IE8和android2.3；v2通用版本仅兼容Ie11等现代浏览器；[参考网址]([http://velocityjs.org](http://velocityjs.org/))

### 基本

#### 参数

`Velocity`可以通过两种方式调用；**函数调用**和**链式调用**；两者返回值相同；但使用它时有一个小的但很重要的区别；

* 如果从另外一个`Velocity`调用传递结果；那么`Velocity(result,…)`作为函数调用将把元素作为一个全新的调用，命令`stop`意味着他们上的活动动画将被停止；
* 如果是链式；`result.velocity(…)`,那么它将在目标中添加动画；这样stop命令只会停止特定的动画；不会影响该元素上的其他动画；

~~~js
//函数式调用
    var div1 = document.querySelector("#div1");
    var div2 = document.querySelector('#div2');
    Velocity(div1, {"font-size": "60px"},function(result){
        console.log(result);
        result.velocity("stop",{"font-size":"12px"})
        
    });
~~~

~~~js
//链式调用；依赖jq
$element
    /* Animate the width property. */
    .velocity({ width: 75 })
    /* Then, when finished, animate the height property. */
    .velocity({ height: 0 });



~~~

#### 全局Velocity

使用`Velocity(…)`生成动画；第一个参数是元素或者元素列表；后跟属性或者其他参数

~~~js
var elements = document.querySelector("div");
Velocity(elements, {"background-color": "red"});
~~~

#### 链式velocity

使用链式调用时；通过元素或者元素列表调用`.velocity()`方法；第一个参数是属性

~~~js
$element
    /* Animate the width property. */
    .velocity({ width: 75 })
    /* Then, when finished, animate the height property. */
    .velocity({ height: 0 });
~~~



### 属性

Velocity将css属性和值的映射作为其第一个参数；将一些可选的用于描述动画的属性对象作为第二个参数；通过修改`Velocity.defaults`可以全局修改覆盖默认值；**使用HEX设置色值时不可以设置连续为00的值；否则不起作用**

#### 逗号分隔

对于css属性，动画属性中的持续时间/动画属性/完成属性

~~~js
element.velocity(propertyMap[,duration][,easing][,complete])

$element.velocity({ top: 50 }, 1000);
$element.velocity({ top: 50 }, 1000, "swing");
$element.velocity({ top: 50 }, "swing");
$element.velocity({ top: 50 }, 1000, function() { alert("Hi"); });
~~~

#### 动画选项

1. `begin:function(elements,activeCall)`:该函数用于在动画执行之前调用；定义动画每调用一次则该函数执行一次；循环动画仅执行一次；回调的第一个参数是该回调的上下文，也是一个元素数组；单独使用该元素时必须遍历元素数组；第二个参数传递一个AnimationCall对象，可用`AnimationCall.element`描述动画的第一个element成员

   ~~~
   $("div").velocity(
     { 
       scale: 1.5
     },
     { 
       duration: 2000,
       begin: function() { 
          alert("This is called before the animation begins.");
       }
     });
   ~~~

2. `complete:function(elements,activeCall)`该函数与`begin`是相对的；每调用一次`velocity(…)`执行动画；该函数在动画结束执行一次；如果循环调用；则完整的回调仅触发一次；在最后一次循环交替结束时；参数同`begin`

   ~~~
   $("div").velocity(
     { 
       scale: 1.5
     },
     { 
       duration: 2000,
       begin: function() { 
          alert("This is called before the animation begins.");
       }
     });
   ~~~

   

3. `delay:+-Num`指定的延迟选项；以毫秒为单位;可以同选项`loop`或者`repeat`选项同时设置，以在每次迭代之间创建暂停；您可以指定一个负数来告诉它从稍后开始动画，这将相应地减少动画的持续时间

   ~~~js
   element.velocity({
       height: ["10em", "5em"]
   }, {
       loop: 4,
       /* Wait 100ms before each direction. */
       delay: 100
   });
   
   element.velocity({
       height: ["10em", "5em"]
   }, {
       duration: 1000,
       /* Start the animation at 40%, and only run for a total of 600ms. */
       delay: -400
   });
   
   /* Use one of the jQuery UI easings. */
   $element.velocity({ width: 50 }, "easeInSine");
   /* Use a custom bezier curve. */
   $element.velocity({ width: 50 }, [ 0.17, 0.67, 0.83, 0.67 ]);
   /* Use spring physics. */
   $element.velocity({ width: 50 }, [ 250, 15 ]);
   /* Use step easing. */
   $element.velocity({ width: 50 }, [ 8 ]);
   ~~~

4. `drag:Bool`:设置该选项为`true`;连续增加集合中每个元素的动画持续时间；最后一个元素将使用等于动画原始值的持续时间进行动画处理；最后一个元素的持续时间会逐渐接近原始值；最终结果是跨元素缓和效果

5. `duration:num/String`:支持毫秒为单位的数字时间或者是描述持续时间的字符串`slow/normal/fast`

6. `easing`属性默认支持一下类型：

   * 预先打包到Velocity中的jqUI动画（除了back/bounce和弹性缓动类型）；
   * CSS3定义的动画类型。`ease/ease-in/ease-out/ease-in-out`
   * CSS3定义的贝塞尔曲线动画
   * 通过数组`[tension张力默认值500,firction摩擦力默认值20]`定义弹性动画；
   * step easing：通过[steps]的形式传递一项数组；动画将使用指定的步数跳转到其结束值

7. fpsLimit:该属性是一个全局属性：通过更改`Velocity.defaults.fpsLimit`设置允许更改动画每秒的最大次数；

8. `loop:true/num`:设置为true时将是无限次动画；或使用num定义动画的次数；确保在同一元素上触发另一个循环之前停止一个无限循环。可以使用`stop`和`finish`命令停止循环。

9. progress传递*进度*选项一个回调函数，以便在动画持续时间内重复触发。回调函数传递有关调用状态的数据,回调作为其上下文和第一个参数传递整个原始DOM（而不是jQuery）元素数组。要单独访问这些元素，必须使用jQuery的$ .each（）或JavaScript的原生.forEach（）遍历数组。此外，它已通过：*完成*，*剩余*，*开始*和*tweenValue*：

   1. **完成**：呼叫的完成百分比（作为小数值）。
   2. **剩余**：在呼叫完成之前**剩余的**时间（以毫秒为单位）。
   3. **start**：调用开始的绝对时间（在Unix时间）。
   4. **tweenValue**：虚拟*补间*动画属性的当前值，可以选择将其传递给Velocity调用。传入*补间*动画属性的实用程序是，它允许您通过*进程*回调捕获其补间进度的确切值。与所有其他Velocity动画属性一样，此虚拟属性受调用的*缓动*行为影响。利用此*补间*属性，您可以将Velocity转换为自定义补间引擎，以便为任意DOM属性的更改设置动画

   ~~~
   $element.velocity({
       opacity: 0,
       tween: 1000 // Optional
   }, {
       progress: function(elements, complete, remaining, start, tweenValue) {
           console.log((complete * 100) + "%");
           console.log(remaining + "ms remaining!");
           console.log("The current tween value is " + tweenValue)
       }
   });
   ~~~

   

10. `queue`该属性定义的是一个动画序列；它将按顺序自动运行；当第一个完成时第二个自动开始；要暂停动画队列请使用`pause`指令,可以将queue设置为*false*以强制新动画调用立即与任何当前活动的动画并行运行

    ~~~js
    // Trigger a normal Velocity animation
    $("div").velocity({ 
        width: 50
      }, {
        duration: 3000
      });
      
    // Trigger parallel queueing halfway through
    setTimeout(function() {
        $("div").velocity({
          height: 50
        }, {
          queue: false,
          duration: 1500
        });
    }, 1500);
    
    
    //或者定义动画序列
    // Create two custom queues.
    $("div")
      .velocity({ translateX: 75 }, { queue: "a" })
      .velocity({ width: 50 }, { queue: "b" })
      .velocity({ translateY: 75 }, { queue: "a" })
      .velocity({ height: 0 }, { queue: "b" })
      
    // Later on, dequeue the "a" queue (translations).
    setTimeout(function() {
      $("div").dequeue("a");
    }, 2000);
    
    // Even later, dequeue the "b" queue (dimensions).
    setTimeout(function() {
      $("div").dequeue("b");
    }, 4000);
    ~~~

    

11. `repeat`选项设置为整数以指定动画应运行的次数；与循环不同，指定的动画完成后不会再次运行；个人看文档刚觉和`loop`选项功能类似

12. `speed`选项定义动画的播放速度；默认是1；

13. `stagger`选项定义每项动画的错开时间；首个动画为零；n个动画的时间是`n*staggerNum`;作为回调函数时；第一个参数事索引值/第二个参数事元素长度/第三个参数事元素数组/第四个参数事字符串"stagger"

14. `sync`:默认为`true`允许多个元素上的动画同时启动

15. `scrollLeft`:

16. `scrollTop`:用于元素上的scrollTop属性，仅支持`px/%`单位

17. `tween`

#### 命令

1. `finish`如果要提前结束动画请使用finish作为velocity的第一个参数

   ~~~js
   element.velocity("finish")
   ~~~

2. `pause`该命令允许暂停正在运行的动画或者队列，可以使用`resume`再次启用动画

3. `property`命令允许在维护Velocity的内部缓存时设置或获取元素的属性，“style”命令实际上是此的同义词

   ~~~js
   element.velocity("property", "opacity", 0.5);
   element.velocity("property", { opacity: 0.5, height: "10em" });
   
   var height = element.velocity("property", "height");
   // = "25px"
   
   var height = elementList.velocity("property", "height");
   // = [ "25px", ... ]
   
   var widthHeight = element.velocity("property", ["width", "height"]);
   // = { width: "25px", height: "25px" }
   
   var widthHeight = elementList.velocity("property", ["width", "height"]);
   // = [ { width: "25px", height: "25px" }, ... ]
   ~~~

4. `registerAction`:通过此命令注册新命令，该命令必须是一个函数；它接受一个提供给正在使用的命令的参数数组，一个元素数组，一个PromiseHandler和一个字符串命令名。

5. `registerEasing`:可以注册自己的动画。动画函数将完成百分比作为小数，起始值，结束值和动画属性名称，然后返回要使用的最终值。开始和结束值将是数字。当动画恰好为0或1时，建议直接复制起始值和结束值（除非动画本身是这样做的）；要注册可以在Velocity中使用自定义的动画；必须使用以下函数调用`registerEasing`命令

   ~~~js
   Velocity("registerEasing", "myCustomEasing", function(percentComplete, startValue, endValue, property) {
   	return percentComplete === 0
   		? startValue
           : percentComplete === 1
   		    ? endValue
               : (0.5 - Math.cos(percentComplete * Math.PI) / 2) * (endValue - startValue);
   });
   ~~~

6. `registerNormalization通过`"registerNormalization"命令注册规范化。这需要一个属性名称，以及一个将元素和可选值作为参数的回调。如果值未定义，那么这是一个get动作，否则它是一个set动作。此外，如果set动作返回false-ey值，则它会自动将同一propertyName的css样式设置为相同的值（因此返回`true`跳过此值）

7. `registerSequence`:该命令允许注册一个或者多个命名序列以供以后使用

8. `pause`暂停动画

9. `stop`停止动画

10. `style`“style”命令是“property”命令的同义词



### 内部定义的功能性函数

1. 检测是否是布尔值

   ~~~js
   	 /**
      * Check if a variable is a boolean.
      */
     function isBoolean(variable) {
         return variable === true || variable === false;
     }
   ~~~

2. 检测是否是函数

   ~~~js
    /**
      * Check if a variable is a boolean.
      */
     function isBoolean(variable) {
         return variable === true || variable === false;
     }
   ~~~

3. 检测是否是函数

   ~~~js
     /**
      * Check if a variable is a function.
      */
     function isFunction(variable) {
         return Object.prototype.toString.call(variable) === "[object Function]";
     }
   ~~~

4. 检测是否是元素

   ~~~js
    /**
      * Check if a variable is an HTMLElement or SVGElement.
      */
     function isNode(variable) {
         return !!(variable && variable.nodeType);
     }
   ~~~

5. 是否是数值

   ~~~js
     /**
      * Check if a variable is a number.
      */
     function isNumber(variable) {
         return typeof variable === "number";
     }
   ~~~

6. 变量是否是普通对象而不是实例

   ~~~js
    /**
      * Check if a variable is a plain object (and not an instance).
      */
     function isPlainObject(variable) {
         if (!variable || (typeof variable === "undefined" ? "undefined" : _typeof(variable)) !== "object" || variable.nodeType || Object.prototype.toString.call(variable) !== "[object Object]") {
             return false;
         }
         var proto = Object.getPrototypeOf(variable);
         return !proto || proto.hasOwnProperty("constructor") && proto.constructor === Object;
     }
   ~~~

7. 是否是字符串

   ~~~js
    /**
      * Check if a variable is a string.
      */
     function isString(variable) {
         return typeof variable === "string";
     }
   ~~~

8. 检查变量是否是类似于数组包装的jQuery、Zepto或类似的，其中每个索引值都是一个节点。

   ~~~js
    /**
      * Check if a variable is an array-like wrapped jQuery, Zepto or similar, where
      * each indexed value is a Node.
      */
     function isWrapped(variable) {
         return variable && variable !== window && isNumber(variable.length) && !isString(variable) && !isFunction(variable) && !isNode(variable) && (variable.length === 0 || isNode(variable[0]));
     }
   ~~~

9. 检查是属性是对象的可枚举成员

   ~~~js
    /**
      * Check is a property is an enumerable member of an object.
      */
     function propertyIsEnumerable(obj, property) {
         return Object.prototype.propertyIsEnumerable.call(obj, property);
     }
   ~~~

10. 克隆一个数组，也适用于类数组

    ~~~js
      /**
       * Clone an array, works for array-like too.
       */
      function cloneArray(arrayLike) {
          return Array.prototype.slice.call(arrayLike, 0);
      }
    ~~~

11. 获取当前毫秒

    ~~~js
      var now = Date.now ? Date.now : function () {
          return new Date().getTime();
      };
    ~~~

    