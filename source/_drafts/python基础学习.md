---
title: python3基础学习
tags: python3
---

## 标准数据类型

六个标准数据类型：`Number数字/String字符串/List列表/Tuple元组/Set集合/Dictionary字典`；前三个为不可变数据；后三个为可变数据；python中变量不需要声明；单每个变量在使用前必须赋值；变量赋值后该变量才会被创建

### 注释方式

单行注释`#`;多行注释用三个单引号`'''`或者三个双引号`"""`讲需要注释的内容括起来

### 运算符

python支持以下类型的运算符：算数运算符、关系运算符、赋值运算符、逻辑运算符、位运算符、成员运算符、身份运算符、运算符优先级

##### 算数运算符

* 常用的加`+`减`-`乘`*`除`/`求余`%`;以及求幂`**`和取整`//`
* `//`得到的并不一定是整数类型的数，它与分母分子的数据类型有关系。

##### 比较运算符

* `==,!=,>,<,>=,<=`

##### 赋值运算符

* `=,+=,-=,*=,/=,`
* `%=`取模赋值运算符
* `**=`幂赋值运算符‘
* `//=`取整赋值运算符
* `:=`海象运算符，可在表达式内部为变量赋值；python3.8新增运算符

##### 位运算符

* `&`按位与运算
* `|`按位或运算
* `^`按位异或运算符
* `~`按位取反运算符
* `<<`左移运算符
* `>>`右移运算符

##### 逻辑运算符

* `and`:布尔与
* `or`布尔或
* `not`布尔非

##### 成员运算符

* `in`:如果在指定的序列中找到值返回`True`;否则返回`False`
* `not in`:如果在指定的序列中没有找到值返回`True`;否则返回`False`

##### 身份运算符

身份运算符用于比较两个对象的存储单元

* `is`:判断两个标识符是不是引用自同一个对象
* `is not`是判断两个标识符是不是引用自不同的对象

~~~python
a = 20
b = 20
 
if ( a is b ):
   print ("1 - a 和 b 有相同的标识")
else:
   print ("1 - a 和 b 没有相同的标识")
 
if ( id(a) == id(b) ):
   print ("2 - a 和 b 有相同的标识")
else:
   print ("2 - a 和 b 没有相同的标识")
~~~

**id()用于获取对象的内存地址，`is`与`==`的区别是is用于判断两个变量的引用对象是否为同一个，==用于判断引用变量的值是否相等**

##### Python运算符优先级

以下表格列出了从最高到最低优先级的所有运算符

| 运算符                   | 描述                                                  |
| :----------------------- | :---------------------------------------------------- |
| **                       | 指数运算符（优先级最高）                              |
| ~、+、-                  | 按位取反，一元加号和减号(最后两个的方法名为 +@ 和 -@) |
| *、/、%、//              | 乘、除、求余、取整除                                  |
| +、-                     | 加法、减法                                            |
| >> 、<<                  | 右移和左移运算符                                      |
| &                        | 按位与                                                |
| ^、\|                    | 异或和位或运算                                        |
| <=、<、>、>=             | 比较运算符                                            |
| ==、!=                   | 等于运算符                                            |
| = %= /= //= -= += *= **= | 赋值运算符                                            |
| is is not                | 身份运算符                                            |
| in not in                | 成员运算符                                            |
| not and or               | 逻辑运算符,and拥有更高优先级                          |

### Number(数字)

python3支持`int/float/complex`等三种不同的数值类型；可以使用`del`语句删除数字对象的引用;可以通过`type()`查询变量所指的对象类型；也可以使用`isinstance`来判断；

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

##### 数字类型转换

* `int(x)`将`x`转换为一个整数
* `float(x)`将`x`转换到一个浮点数
* `complex(x)`将`x`转换到一个复数；实数部分为x；虚数部分为0
* `complex(x,y)`将x和y转换到一个复数；实数部分为x；虚数部分为y

##### 随机数函数

python的随机数函数都需要引入random模块

| 函数                            | 描述                                                         |
| ------------------------------- | ------------------------------------------------------------ |
| choice(seq)                     | 从序列的元素中随机挑选一个元素                               |
| randrange([start],stop,[,step]) | 从指定范围内按指定基数递增的集合中获取一个随机数，基数默认值为1 |
| random()                        | 随机生成一个随机数[0,1)                                      |
| seed([x])                       | 改变随机数生成器的种子；使用seed方法后random方法生成的数字将会是同一个 |
| shuffle(lst)                    | 将序列的所有元素随机排序                                     |
| uniform                         | 随机生成一个实数；它在[x,y]范围内                            |



### 字符串

Python中的字符串用单引号 **'** 或双引号 **"** 括起来，同时使用反斜杠 **\** 转义特殊字符。字符串的截取的语法格式如下：

```
变量[头下标:尾下标] #数值可正负；头下标索引负数表示从后边索引；尾下标索引表示从后边截取
```

- 反斜杠可以用来转义，使用r可以让反斜杠不发生转义。
- 字符串可以用+运算符连接在一起，用*运算符重复。
- Python中的字符串有两种索引方式，从左往右以0开始，从右往左以-1开始。
- Python中的字符串不能改变。

##### Pthon字符串运算符

| 操作符 | 描述                                               |
| ------ | -------------------------------------------------- |
| +      | 字符串连接                                         |
| *      | 重复输出字符串                                     |
| []     | 通过索引获取字符串中的字符                         |
| [:]    | 截取字符串中的一部分；遵循左闭右开原则             |
| in     | 成员运算符；如果字符串中包含给定的字符返回True     |
| not in | 成员运算符 - 如果字符串中不包含给定的字符返回 True |
| r/R    | 原始字符串；所有的字符串都直接按照字面的意思使用   |

##### Python的字符串内建函数

| 方法                                | 描述                                                         |
| ----------------------------------- | ------------------------------------------------------------ |
| capitalize()                        | 将字符串的第一个字符转为大写`str.capitalize()`               |
| center(width,fillchart)             | 返回一个指定宽度并将字符串居中的字符串；fillchart为填充的字符 |
| count(str,beg=0,end = len)          | 返回str在字符串中出现的次数；beg和end用于指定检索字符串的范围 |
| endswith(suffix,start[,end])        | 用于判断字符串是否以指定后缀结尾；如果是指定后缀结尾则返回True |
| find(str,beg=0,end=len(string))     | 在指定的beg和end之间查找字符串；如果有则返回查找到的字符索引；没有返回-1 |
| isalnum()                           | 判断一个字符串是否是数字和字母组成；不包含其他元素           |
| isalpha()                           | 至少有一个字符并且所有字符都是字母或者文字则返回True         |
| isdigit()                           | 如果字符串只包含数字则返回True                               |
| islower()                           | 字符串中包含至少一个区分大小写的字符，并且所有这些(区分大小写的)字符都是小写，则返回 True |
| isnumeric()                         | 如果字符串中只包含数字字符，则返回 True，否则返回 False      |
| isspace()                           | 如果字符串只包含空白；则返回True                             |
| isupper()                           | 同islower相反                                                |
| join(seq)                           | 以指定字符串作为分隔符，将 seq 中所有的元素(的字符串表示)合并为一个新的字符串 |
| len(string)                         | 返回字符串的长度                                             |
| replace(old,new[,max])              | 将匹配到的字符替换成指定字符串；选填参数max为替换最大次数    |
| split(str="",num=string.count(str)) | 以 str 为分隔符截取字符串，如果 num 有指定值，则仅截取 num+1 个子字符串 |

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

##### 列表常用函数

| 函数      | 描述               |
| --------- | ------------------ |
| len(list) | 返回列表元素个数   |
| max(list) | 返回列表元素最大值 |
| min(list) | 返回列表元素最小值 |
| list(seq) | 将元组转换为列表   |

##### 列表常用方法

| 方法                                | 描述                                                         |
| ----------------------------------- | ------------------------------------------------------------ |
| `list.append(obj)`                  | 在列表末尾添加新的元素                                       |
| `list.count(obj)`                   | 统计某个元素在列表中出现的次数                               |
| `list.extend(seq)`                  | extend() 函数用于在列表末尾一次性追加另一个序列中的多个值,`seq`元素列表；可以使列表、元组、集合、字典、若是字典则仅仅会将key作为元素添加到列表 |
| `list.index(obj)`                   | 在列表中查找某一个元素的位置                                 |
| `list.insert(index,obj)`            | 将对象插入列表                                               |
| `list.pop(index)`                   | 移除列表中的一个元素；默认是最后一个元素；并且返回该元素的值 |
| `list.remove(obj)`                  | 移除列表中某个值的第一个匹配项                               |
| `list.reverse()`                    | 反向列表中元素                                               |
| `list.sort(key=None,reverse=False)` | 对原列表进行排序                                             |
| `list.clear()`                      | 清空列表                                                     |
| `list.copy()`                       | 复制列表                                                     |

### 元组

元组（tuple）与列表类似，**不同之处在于元组的元素不能修改**。元组写在小括号 `()`里，元素之间用逗号隔开。元组中的元素类型也可以不相同：

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

##### 集合常用内置方法

| 方法                   | 描述                           |
| ---------------------- | ------------------------------ |
| add()                  | 为集合添加元素                 |
| clear()                | 移除集合中的所有元素           |
| copy()                 | 拷贝一个集合                   |
| intersection()         | 返回集合的交集                 |
| symmetric_difference() | 返回两个集合中不重复的元素集合 |
| union()                | 返回两个集合的并集             |
| update()               | 给集合添加元素                 |

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

