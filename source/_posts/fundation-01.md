---
title: fundation-01
date: 2018-11-25 20:49:45
tags:
---

## 数字

* Int:有符号整数值类型

  * 返回指定范围内的随机值

    ~~~swift
    static func random(in range:<Range<Int>)->Int
    // demo;随机生成100以内的随机数
    for _ in 1...3{
        print(Int.random(in:1..<100))
        print(Int.random(in:1...100))
    }
    ~~~

  * 同时计算除法的商和余数

    ~~~swift
    func quotientAndRemainder(dividingBy rhs:Int) -> (quotient:Int,remainder:Int)
    //demo
    let x = 1000000
    let (q,r) = x.quotientAndRemainder(dividingBy:Int)//q==1071;r=757
    ~~~

  * 利用系统的URLComponents获取IOS中对应结构的元素

    * 属性值

      ~~~
      public var scheme:String?	协议
      public var user:String?
      public var password:String?
      public var host:String?	域名
      public var port:String?	端口
      public var path:String?	路径
      public var query:String?	参数
      public var fragment:String?
      public var queryItem:[URLQueryItem]?	参数集合
      ~~~


  #### 字符串String

  * 使用`\()`可以快速的将其他类型转为字符串；可以使用`+`组合字符串；多行字符串使用`"""`三个双引号括起来
  * 获取字符串中某一个元素的位置`string.firstIndex(of:"")??string.endIndex`
  * `isEmpty:Bool`一个布尔值；表示集合是否为空；也可测试字符串是否为空；使用`count`获取字符创的长度
  * 从文件或URL创建字符串`init(contentsOf:URL) 或者init(contentOfFile:String)`;使用`append(string/character)`将给定的字符或者字符串追加到字符串中
  * 使用`insert(Character,at:String.Index)`将指定字符串插入到指定位置
  * 替换子字符串`replaceSubrange`
  * 删除子字符串
    * `remove(at:String.Index) -> Character`删除并返回指定位置的字符
    * `removeAll(keepingVapacity:Bool)`删除所有元素
    * `removeAll(where:(character) -> Bool)`删除满足给定微词的左右元素

#### 查找字符串

* `hasPrefix(String)`返回一个布尔值；字符串是否以指定的前缀开头
* `hasSuffix(string)`返回一个布尔值；指示字符串是否以指定的后缀结尾
* `contains(Character)`返回一个布尔值；是否以指定的后缀结尾

### 集合

* 集合包含：数组Array/字典Dictionary/Set无序的独特元素集合
* 数组：使用`isEmpty`判断数组是否为空；使用`first`和`last`属性安全访问第一个和最后一个元素的值；如果为空则为`nil`
* `append(_:)`将单个元素添加到数组的末尾；`append(contentsOf:)`同时添加多个元素

