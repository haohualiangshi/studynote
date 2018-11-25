---
title: referenceType_1
date: 2017-07-06 16:38:37
tags: [js,引用类型]
categories: js教程总结
---

[TOC]

## 引用类型

在ECMAScript中，引用类型是一种数据结构，用于将数据和功能组织在一起。对象是某个特定引用功能的实例

### object类型

创建object实例的方式有两种：

*    使用new操作符后跟Object构造函数

*    ~~~javascript
     var person=new Object();
     person.name="haohualiangshi";
     person.age=29;
     ~~~

*    使用对象字面量的表示方法

*    ~~~javascript
     var person={
       name:"haohualiangshi",
       age:25
     }
     ~~~

*    对象字面量是向函数传递大量可选参数的的首选方式

### Array类型

js中数组的每一项都可以保存不同类型的数据。创建数组的基本方式有两种：使用Array构造函数，使用数组字面量表示法。

数组的存储方式有栈方法和队列方法：

*    栈是一种LIFO（后进先出）的数据结构，栈的操作方法：push()和pop()方法，push方法可以接收任意数量的参数，把他们逐个添加到数组末尾，并返回修改后的数组长度。而pop方法则从数组末尾移除最后一项；并返回移除的项。
*    队列方法的访问规则是FIFO（先进先出）；队列是在列表的末端添加；在列表的前端移除项；其操作是用push方法在数组的末尾添加数组项；用shift方法移除数组的第一项并返回该项；另外数组还提供了unshift方法；其作用与shift方法相反；与push类似；在数组的前端添加任意个数组项并返回新的数组长度，使用shift和unshift方法可以从相反的方向模拟队列.

数组中定义好的的重排序方法：

*    reverse()  :翻转数组项的顺序
*    sort()  : 默认情况下sort方法是按升序排序的；注意；sort方法比较的是字符串：sort方法会调用每个数组项的toString；然后进行对比。该函数可以通过传递两个参数进行灵活的排序操作：如果第一个参数位于第二个参数之前则返回一个负数，如果两个参数相等则返回0，如果第一个参数位于第二个参数之后，则返回正数。

操作方法：

*    concat()方法可以基于当前数组中的所有项创建一个新的数组，他的参数可以传递一个或者多个

     ~~~javascript
     var colors=["red","green","#888"];
     colors.concat("#999",["#333","#999"]);//["red", "green", "#888", "#999", "#333", "#999"]
     ~~~

*    slice()方法：它能够基于当前数组的一个或者多个项创建一个新数组。两个参数表示起始位置和结束位置；第二个参数可选

*    splice()方法：可以完成删除、插入和替换：该方法始终返回一个数组，该数组包含从原始数组中删除的项。无删除项则返回空数组。

     *    删除：需要指定两个参数；要删除的第一项的位置和要删除的项数

          ~~~javascript
          var colors=["red","green","yellow"];
          colors.splice(0,2);//["red", "green"]
          ~~~

     *    插入：需要提供三个参数，起始位置、删除的项数和插入的任意项数

          ~~~javascript
          var colors=["red","green","yellow"];
          colors.splice(1,0,"#999","#888");
          console.log(colors);
          ~~~

     *    替换：可以向指定的位置插入任意数量的项；并指定三个参数：起始位置、要删除的项数和要插入的任意数量的项

位置方法：两个位置方法：indexof()和lastIndexOf()。这两个方法都接收两个参数：要查找的项和表示查找起点位置的索引；其中indexOf()从数组的开头向后查找；lastIndexOf()从数组的末尾向前查找；没有找到则返回-1。

迭代方法：es5定义了**5**种迭代方法。每个方法接收两个参数：要在每一项上运行的函数和（可选的）运行函数的作用域对象--影响this的值；传入这些方法中的函数会接收三个参数：数组项的值、该项在数组中的位置和数组对象本身；以下是五个迭代方法

*    every():对数组中的每一项运行给定的函数，如果该函数每一项都返回true；则返回true

*    filter():对数组中的每一项运行给定函数；返回该函数会返回true的项组成的数组

*    forEach():对数组中的每一项运行给定函数，这个方法没有返回值

*    map()：对数组中的每一项运行给定函数；返回每次函数调用的结果返回的数组

*    some(): 对数组中的每一项运行给定函数；如果该函数对数组中的任意一项返回true则返回true

     ~~~javascript
     var numArr=[1,2,3,4,5,4,3,2,1];
     var everyResult=numArr.every(function(item,index,array){
       return (item>2);
     });
     console.log(everyResult);
     var someResult=numArr.some(function(item,index,array){
       return (item>2);
     });
     console.log(someResult);

     var filterResult=numArr.filter(function(item,index,array){
       return (item>2);
     });
     console.log(filterResult);
     var mapResult=numArr.map(function(item,index,array){
       return (item >2);
     })
     console.log(mapResult);
     //forEach没有返回值；能够对数组的每一项执行操作
     numArr.forEach(function(item,index,array){
       console.log(item+1);
     })
     ~~~

es5新增了两个归并方法：reduce()和reduceRight(),这两个方法都会迭代数组的所有项；然后构建一个最终返回的值。reduce()方法从数组的第一项开始；逐个便利到最后；而reduceRight()则从数组的最后一项开始；逐个便利到第一项。这两个方法都接收两个参数：一个在每一项上调用的函数和可做为归并基础的初始值（可选）

~~~javascript
var reduceArr=[1,2,3,4,5];
reduceArr.reduce(function(prev,cur,index,array){
  //四个参数分别是前一个结果值、当前值、项的索引和数组对象
  console.log(cur);
  return prev+cur;
});
reduceArr.reduceRight(function(prev,cur,index,array){
  console.log(cur);
  return prev+cur;
})
~~~

### Date类型

通过new Date()来获取当前的时间的字符串；如果要获取特定日期；需要传入表示该日期的毫秒数‘为例；为了简化过程；js提供了两个方法Date.parse()和Date.UTC();

Date.parse()方法接收一个表示日期的字符串参数；然后尝试根据字符串返回对应的毫秒数；解析不成功则返回NaN

ES5中添加了Date.now()方法；返回调用该方法时日期和时间的毫秒数；日期做比较时调用valueof方法；日期比较的是毫秒数

### Function类型

函数其实是对象；每个函数都是Function类型的实例，因此函数名实际上也是指向函数对象的指针。函数声明和函数表达式是有区别的：函数声明在解析时会提升；函数表达式则不会；必须先定义后使用

在函数内部有两个特殊的对象：arguments和this

*    arguments拥有一个callee的属性，该属性是个指针，指向拥有这个arguments对象的函数，在非严格模式下使用，例如函数阶乘

     ~~~javascript
     function factorial(num){
       if(num<=1){
         return 1
       }else{
         return num*arguments.callee(num-1);
       }
     }
     factorial(5);//120
     ~~~

*    函数的另外一个对象是this：this引用的是函数据以执行的环境对象（在网页的全局作用域中调用函数时this对象引用的就是不window对象

*    在非严格模式下es5规范化了另外一个函数对象的属性：caller属性保存着当前函数的函数的引用；如果在全局作用域中调用当前函数；他的值为null;在严格模式下使用caller或者arguments.callee.caller都会造成错误

     ~~~javascript
     "use strict"
     function outer(){
       inner();
       console.log(outer.caller);
     }
     function inner(){
       alert(arguments.callee.caller);//指向函数outer
     }
     outer();
     ~~~

*    函数还具有length和prototype属性：length属性表示形参的个数，prototype属性是保存他们所有实例方法的真正所在，该属性不可枚举

*    每个函数都包含两个非继承而来的方法：apply()和call()，这两个方法的用途是在特定的作用域中调用函数；并能扩展函数的作用域

     ~~~javascript
     window.color="red";
     var o={color:"blue"};
     function sayColor(){
       console.log(this.color);
     }
     sayColor.call(this);
     sayColor.call(o);
     sayColor.call(window);
     ~~~

*    es5还定义了bind()方法;该方法会创建一个函数的实例；其this值会被绑定到传给bind()函数的值

     ~~~javascript
     var color="red";
     var o={color:"blue"};
     function sayColor(){
       console.log(this.color);
     }
     var objectColor=sayColor.bind(o);

     ~~~

### 基本包装类型

为了便于操作基本类型的值；js引入了三个特殊的引用类型；Boolean、Number和String。

Number类型提供了一些用于将数值格式化为字符串的方法：

*    toFixed()方法会按照指定的小数位返回数值的字符串表示,该方法具有自动舍入的特性

~~~javascript
var num=10.005;
console.log(num.toFixed(2));//10.01
~~~

*    toExponential()方法；该方法返回指数表示法；表示数值的字符串形式;接收一个参数用来表示小数位

     ~~~javascript
     var num=19;
     console.log(num.toExponential(2))
     ~~~

*    toPrecision()可以根据参数的不同用恰当的字符串来表示数值

     ~~~javascript
     var num=99;
     console.log(num.toPrecision(1));
     console.log(num.toPrecision(2));
     console.log(num.toPrecision(3));
     ~~~

### String类型

String对象的属性和方法也可以在所有的字符串中访问，string类型的每个实例都有length属性，表示字符串包含多少个字符

*    charAt()和charCodeAt();这两个方法都接收一个表示字符索引位置的参数；charAt()返回给定位置的那个字符。charCodeAt()返回的是索引位置对应的编码

     ~~~javascript
     var test="hello";
     console.log(test.charAt(2));//"l"
     console.log(test.charCodeAt(2))//108
     ~~~

*    concat()方法的作用同数组的concat方法相同，用于将一个或者多个字符串拼接起来，返回得到的新字符串；

*    基于子字符串创建新字符串的三个方法：slice()、substr()和substring();这三个方法都返回被操作字符串的子字符串，接收一个或者两个参数。第二个参数的区别是slice()和substring()指定的是字符串最后一个字符后边的位置(包头不包尾)。而substring()的第二个参数指定的则是返回字符的个数;如果不传第二个参数则默认截取到最后。这三个方法都对原始字符串无影响

     这三个方法都是可以传入负值的；对负值的解析也不相同：slice()方法会将传入的负值与长度相加，substr()会将负值的第一个参数与长度相加；第二个参数转为0，substring会将所有的负值转为0

     ~~~javascript
     var test="this is a test string";
     console.log(test.substring(1,3));//hi
     console.log(test.slice(1,3));//hi
     console.log(test.substr(1,3));//his
     ~~~

*    indexOf()和lastIndexOf();从一个字符串中搜寻给定的字符串，然后返回给定字符串的位置；没找到则返回-1

*    trim()方法；这个方法创建一个字符串的副本，删除前置以及后置的所有空格并返回结果

*    字符串的大小写转换：js中有四个涉及大小写转换的方法：toLowerCase()、toLocaleLowerCase()、toUpperCase()、toLocalUpperCase()

*    字符串的模式匹配方法

     *    match()方法，在字符串上调用这个方法本质上与调用RegExp的exec()方法相同，match方法只接收一个参数，要么是个正则表达式，要么是个RegExp对象

          ~~~javascript
          var text="cat,bat,sat,fat";
          var pattern=/.at/;
          //与 pattern.exec(text)相同
          var matches=text.match(pattern);
          console.log(matches);//["cat", index: 0, input: "cat,bat,sat,fat"]
          ~~~

     *    search():该方法的唯一参数与match()相同；返回字符串中第一个匹配项的索引；未找到则返回-1

     *    replace()方法：该方法接收两个参数，第一个参数可以是正则表达式或者一个字符串，第二个参数可以是个字符串或者函数

          ~~~javascript
          var text="cat,bat,sat,fat";
          var result=text.replace("at","ond");
          console.log(result);//cond,bat,sat,fat
          //替换所有需要使用正则的全局标志
          result=text.replace(/at/g,"ond");
          console.log(result);//cond,bond,sond,fond
          ~~~

*    split()方法：这个方法可以基于指定的分割符将一个字符串分割成多个字符串，并将结果放在数组中；该方法可以接收第二个参数用于截取数组的长度。

*    localeCompare()方法：这个方法比较两个字符串，并返回下列值中的一个

     *    如果字符串在字母表中应该排在字符串参数之前，则返回一个负数
     *    如果字符串等于字符串参数，则返回0
     *    如果字符串在字母表中的位置排在字符串参数之后，返回一个正数

     ~~~javascript
     var stringValue="yellow";
     console.log(stringValue.localeCompare("brick"));//1
     console.log(stringValue.localeCompare("yellow"));//0
     console.log(stringValue.localeCompare("zoo"));//-1
     ~~~

     ​