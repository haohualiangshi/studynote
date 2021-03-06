---
title: python字符串常用操作
tags: python笔记
---

## python字符串中的常用方法

#### 去掉空格和特殊符号

* name.strip():去掉空格和换行符
* name.strip("xx"): 去掉某个字符串
* name.lstrip(): 去掉左边的空格和换行符
* name.rstrip():去掉右边的空格和换行符

#### 字符串的搜索和

* `name.count('x')`查找某个字符在字符串中出现的次数；
* `name.capitalize()`首字母大写；
* `name.center(n,'-')`返回长度为n的字符串；原始字符串长度大于n则返回字符串；小于n则两端用`'-'`补齐；
* `name.find('x')`查找字符串中的字符`x`;返回查找到的第一个字符的索引值；不存在则返回-1
* `name.index('x')`找到这个返回下标；不存在会报错
* `name.replace(oldStr,newStr,[max])`字符串替换,第三个参数是替换字符串的最大次数
* `name.format()`方法；字符串的参数使用`{num}`表示；`num`表示第几个参数；从0开始叠加;使用`:`指定代表元素需要的操作；
  * 后接小数点加数字表示保留的小数点位数；如`:.3`小数点三位，
  * `:b`二进制;将数字以2为基础进行输出
  * `:c`字符；在打印之前将整数转换成对应的Unicode字符串
  * `:d`十进制整数；将数字以10为基数进行输出
  * `:o`八进制；将数字以8为基数进行输出
  * `:x`十六进制；将数字以16为基数进行输出；9以上的位数用小写字母
  * `:e`冥符号；用科学计数法打印数字；用e表示冥
  * `:g`一般格式,将数值以fixed-point格式输出；当数值特别大的时候；用冥形式打印
  * `:n`数字，当值为整数时和`:d`相同。值为浮点数时和`:g`相同；不同的是他会根据设置区域设置插入数字分隔符
  * `:%`百分数。将数值乘以然后以fixed-point(`:f`)格式打印；值后边会有一个百分号