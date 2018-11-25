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

    