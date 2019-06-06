---
title: python3基础学习
tags: python3
---

## 标准数据类型

六个标准数据类型：`Number数字/String字符串/List列表/Tuple元组/Set集合/Dictionary字典`；前三个为可变数据；后三个为可变数据

### Number(数字)

python3支持`int/float/bool/complex`;可以通过`type()`查询变量所指的对象类型；也可以使用`isinstance`来判断；

~~~python
a,b,c,d = 20,5.5,True,4+3j
print(type(a),type(b),type(c),type(d));

isinstance(a,int)
~~~

#### 数值运算

- Python可以同时为多个变量赋值，如a, b = 1, 2。
- 一个变量可以通过赋值指向不同类型的对象。
- 数值的除法包含两个运算符：**/** 返回一个浮点数，**//** 返回一个整数。
- 在混合计算时，Python会把整型转换成为浮点数。

### 字符串

Python中的字符串用单引号 **'** 或双引号 **"** 括起来，同时使用反斜杠 **\** 转义特殊字符。字符串的截取的语法格式如下：

```
变量[头下标:尾下标] #数值可正负；头下标索引负数表示从后边索引；尾下标索引表示从后边截取
```

- 反斜杠可以用来转义，使用r可以让反斜杠不发生转义。
- 字符串可以用+运算符连接在一起，用*运算符重复。
- Python中的字符串有两种索引方式，从左往右以0开始，从右往左以-1开始。
- Python中的字符串不能改变。

### 列表

列表截取同字符串相同；加号`+`是列表连接运算符，星号`*`是重复操作；列表的截取还有可选的第三个参数表示步长；步长为负数表示逆向

~~~python
def reverseWords(input): 
      
    # 通过空格将字符串分隔符，把各个单词分隔为列表
    inputWords = input.split(" ") 
  
    # 翻转字符串
    # 假设列表 list = [1,2,3,4],  
    # list[0]=1, list[1]=2 ，而 -1 表示最后一个元素 list[-1]=4 ( 与 list[3]=4 一样) 
    # inputWords[-1::-1] 有三个参数
    # 第一个参数 -1 表示最后一个元素
    # 第二个参数为空，表示移动到列表末尾
    # 第三个参数为步长，-1 表示逆向
    inputWords=inputWords[-1::-1] 
  
    # 重新组合字符串
    output = ' '.join(inputWords) 
      
    return output 
  
if __name__ == "__main__": 
    input = 'I like runoob'
    rw = reverseWords(input) 
    print(rw)	#"runoob like I"
~~~

### 元组

元组（tuple）与列表类似，不同之处在于元组的元素不能修改。元组写在小括号 `()`里，元素之间用逗号隔开。元组中的元素类型也可以不相同：

~~~python
tuple = ( 'abcd', 786 , 2.23, 'runoob', 70.2  )
tinytuple = (123, 'runoob')
 
print (tuple)             # 输出完整元组
print (tuple[0])          # 输出元组的第一个元素
print (tuple[1:3])        # 输出从第二个元素开始到第三个元素
print (tuple[2:])         # 输出从第三个元素开始的所有元素
print (tinytuple * 2)     # 输出两次元组
print (tuple + tinytuple) # 连接元组
~~~

- 与字符串一样，元组的元素不能修改。
- 元组也可以被索引和切片，方法一样。
- 注意构造包含 0 或 1 个元素的元组的特殊语法规则。
- 元组也可以使用+操作符进行拼接。

### 集合

集合（set）是由一个或数个形态各异的大小整体组成的，构成集合的事物或对象称作元素或是成员。基本功能是进行成员关系测试和删除重复元素；可以使用大括号`{ }`或者`set()`函数创建集合，注意：创建一个空集合必须用`set()`而不是`{}`，因为`{}`是用来创建一个空字典

~~~python
#!/usr/bin/python3
 
student = {'Tom', 'Jim', 'Mary', 'Tom', 'Jack', 'Rose'}
 
print(student)   # 输出集合，重复的元素被自动去掉
 
# 成员测试
if 'Rose' in student :
    print('Rose 在集合中')
else :
    print('Rose 不在集合中')
 
 
# set可以进行集合运算
a = set('abracadabra')
b = set('alacazam')
 
print(a)
 
print(a - b)     # a 和 b 的差集
 
print(a | b)     # a 和 b 的并集
 
print(a & b)     # a 和 b 的交集
 
print(a ^ b)     # a 和 b 中不同时存在的元素
~~~

### 字典

字典（dictionary）是Python中另一个非常有用的内置数据类型。列表是有序的对象集合，字典是无序的对象集合。两者之间的区别在于：字典当中的元素是通过键来存取的，而不是通过偏移存取。在同一个字典中，键(key)必须是唯一的；

### 数据类型转换

内置的函数可以执行数据类型之间的转换

| 函数                                                         |                        描述                         |
| :----------------------------------------------------------- | :-------------------------------------------------: |
| int(x[ [,base\])](https://www.runoob.com/python3/python-func-int.html) |    将x转换为一个整数,base可选进制数；默认十进制     |
| [float(x)](https://www.runoob.com/python3/python-func-float.html) |                 将x转换到一个浮点数                 |
| [complex(real [,imag\])](https://www.runoob.com/python3/python-func-complex.html) |                    创建一个复数                     |
| [str(x)](https://www.runoob.com/python3/python-func-str.html) |                将对象 x 转换为字符串                |
| [repr(x)](https://www.runoob.com/python3/python-func-repr.html) |             将对象 x 转换为表达式字符串             |
| [eval(str)](https://www.runoob.com/python3/python-func-eval.html) | 用来计算在字符串中的有效Python表达式,并返回一个对象 |
| [tuple(s)](https://www.runoob.com/python3/python3-func-tuple.html) |               将序列 s 转换为一个元组               |
| [list(s)](https://www.runoob.com/python3/python3-att-list-list.html) |               将序列 s 转换为一个列表               |
| [set(s)](https://www.runoob.com/python3/python-func-set.html) |                   转换为可变集合                    |
| [dict(d)](https://www.runoob.com/python3/python-func-dict.html) |  创建一个字典。d 必须是一个序列 (key,value)元组。   |
| [frozenset(s)](https://www.runoob.com/python3/python-func-frozenset.html) |                  转换为不可变集合                   |
| [chr(x)](https://www.runoob.com/python3/python-func-chr.html) |              将一个整数转换为一个字符               |
| [ord(x)](https://www.runoob.com/python3/python-func-ord.html) |             将一个字符转换为它的整数值              |
| [hex(x)](https://www.runoob.com/python3/python-func-hex.html) |         将一个整数转换为一个十六进制字符串          |
| [oct(x)](https://www.runoob.com/python3/python-func-oct.html) |          将一个整数转换为一个八进制字符串           |

## 