---
layout: _drafts
title: shell命令行基础
tags: shell命令行
date: 2019-02-21 14:18:48
---


#### 遍历文档目录

~~~shell
打开文件夹
cd filePath/fileName
查看当前的文件目录
pwd

显示文件和目录列表
ls
显示所有的文件和目录
ls -a
~~~

#### 处理文件

**使用`-i`强制问询对文件的操作**

~~~shell
创建文件
touch 文件名.文件类

复制文件;cp命令需要两个参数，原对象和目标对象；
cp source(原对象) destination(目标对象)

强制问询是否覆盖存在的文件
cp -i source(原对象) destination(目标对象)

递归复制整个文件夹
cp -R source(原对象) destination(目标对象)

mv命令可以将文件和目录移动到另一个位置或者重命名
mv oldName newName

移除文件rm
rm -i fillName
~~~

#### 处理目录

~~~shell
创建目录
mkdir fileName

想要创建多个目录和子目录。需要加入-p参数
mkdir -p New_Dir/Sub_Dir/Under_Dir

删除目录
rmdir emptyDirName

删除非空目录
rm -r
~~~

#### 查看文件内容

~~~shell
查看文件类型
file my_file

查看整个文件内容，三种不同的命令
cat命令是显示文本文件找那个所有数据的得力工具
cat test

more命令显示文本文件
less命令查看文件

查看部分文件
tail命令会显示文件最后几行的内容
head命令显示文件开头内容

~~~

#### 打包或者压缩文件

~~~
tar 参数 文件目录列表(打包文件或者解压缩)
~~~

参数：

* `-c`建立新的归档文件
* `-r`向归档文件末尾追加文件
* `-x`从归档文件中解出文件
* `-O`将文件解开到标准输出
* `-v`处理过程中相关信息
* `-f`对普通文件操作
* `-z`调用gzip来压缩归档文件，与`-x`一起用时调用gzip完成解压缩
* `-Z`调用compress来压缩归档文件，与`-x`一起用时调用compress完成解压缩

~~~
zip 参数 文件名.zip 目标文件名
~~~

参数：

* `-q`不显示压缩进度状态
* `-r`子目录文件全部压缩为zip
* `-e` 文件需要加密
* `-m`压缩完删除源文件
* `-o`设置所有压缩文件的最后修改时间为当前压缩时间

#### 进程

1. 探查进程

   ~~~
   ps 参数
   打印
     PID TTY           TIME CMD
   15829 ttys001    0:00.10 -bash
   ~~~


2. 挂载存储媒体

   1. mount命令；mount命令会输出当前系统上挂载的设备列表

3. 文件搜索:`grep`命令会在输入或指定的文件中查找包含匹配指定模式的字符的行

   ~~~
   grep [options] pattern [file]
   ~~~

4. 使用`history`命令打印使用过的指令;使用`!!`然后回车就能使用刚刚用过的指令；使用`!数字`执行该数字对应的命令

5. alias命令创建属于自己的别名

#### 常见的bash命令

* `cat`列出指定文件的内容
* `clear`从终端仿真器或者虚拟控制台终端删除文本
* `cp`将指定文件复制到另一个位置
* `file`查看指定文件的文件类型
* `ls`列出目录内容
* `mkdir`在当前目录下创建指定目录
* `mv`重命名文件；`rm`删除指定文件；`rmdir`删除指定目录
* `pwd`显示当前目录
* `sudo`以root用户账户身份运行应用程序
* `touch`新建一个空文件或更新一个已有文件的时间戳

