---
title: oo
date: 2017-07-17 14:53:32
tags:[js,面向对象的程序设计]
categories:js教程总结
---

[TOC]

## 面向对象的程序设计

ECMAScript中有两种属性：数据属性和访问属性。

1.   数据属性包含一个数据值的位置；有四个描述其行为的特性：

     *    [Configurable]：表示是否通过delete删除属性从而从新定义属性，默认值为true
     *    [Emumberable] :能否通过for-in循环遍历属性；默认true
     *    [writable] :表示能否修改属性的值
     *    [value] ：这个属性的数据值

     要修改属性的默认的特性：必须使用ecmaScript5定义的Object.defineProperty()属性；该方法接收三个参数：属性所在的对象、属性的名字和一个描述符对象(即上边四种特性中的一个或者多个)；注意：configurable的属性一旦设置为false就不能再进行修改。

2.   访问器属性：访问器属性不包含数据值；他们包含一对getter和setter函数（这两个函数非必须）；访问器属性有四个特性

     *    [Configurable]：表示是否通过delete删除属性从而从新定义属性，默认值为true
     *    [Emumberable] :能否通过for-in循环遍历属性；默认true
     *    [get ] : 在读取属性时调用的函数，默认为undefined
     *    [set] ：在写入函数时调用的函数，默认undefined

     访问器属性不能直接定义；必须通过Object.defineProperty()来定义

     ~~~javascript
     var book={
       _year:2016,
       edition:2
     }
     Object.defineProperty(book,"year",{
       get:function(){
         return this._year;
       },
       set:function(newValue){
         if(newValue>2004){
           this_year=newValue;
           this.edition+=newValue-2004;
         }
       }
     })

     book.year
     ~~~

ECMAScript定义了一个Object.defineProperties()方法来一次性定义多个属性；该方法接收两个对象参数

~~~javascript
var book={};
Object.defineProperties(book,{
  _year:{
    writable:true,
    value:2004
  },
  edition:{
    writable:true,
    value:2
  }
});
Object.getOwnPropertyDescriptor(book,"_year");//{value: 2004, writable: true, enumerable: false, configurable: false}
~~~

JS 5定义了Object.getOwnPropertyDescriptor()方法；这两个方法接收两个参数：属性所在的对象和要描述其描述符的属性名称；返回的是一个对象；即数据属性或者访问器属性