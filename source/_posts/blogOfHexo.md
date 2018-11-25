---
title: blogOfHexo
date: 2017-06-30 18:48:35
tags: [tool,hexo]
categories: 搭建博客
---

## 博客搭建教程

>    参考链接：<https://smartbeng.github.io/2017/03/26/blogFinish/>

1.   安装Node.js\Git。并在git上创建仓库：<https://github.com/haohualiangshi/haohualiangshi.github.io>，要求仓库名必须和用户名相同。即必须是userName.github.io;我的userName是haohualiangshi
2.   安装Hexo工具
     1.   在任意盘创建Hexo文件（必须是Hexo文件命名）；在Hexo文件夹的父级打开git命令行；运行`$ npm install -g hexo `;
     2.   打开Hexo文件夹；运行`hexo init`
     3.   运行`hexo g`用来生成页面；运行`heox s`启动本地服务
     4.   hexo 常用命令
          1.   `hexo new page "pageName"`新建文件夹。自动生成在source目录下

          2.   `hexo new "postName"`新建md文件；在source下的_post目录下；

          3.   hexo运行的命令生成的页面文件是放在public文件夹下；新建一个文件夹用来往github上推送本地的文件。eg:我本地新建的是.deploy文件夹；克隆仓库文件,在hexo目录下运行`git clone https://github.com/haohualiangshi/haohualiangshi.github.io .deploy/storm.git.github.io`或者打开storm.git.github.io文件夹直接执行复制指令

          4.    ~~~
               hexo clean
               hexo generate
               cp -R public/* .deploy/storm.github.io
               git add .
               git commit -m "update"
               git push origin master -u
                ~~~

               1.   将上边文件类型命名为.sh文件类型；点击之后自动完成写入的指令完成上传；代码的意思：清除缓存、生成静态文件、将静态文件中的所有文件复制到.deploy/storm.github.io文件夹下、完成git的添加上传；

3.   关于主题的更换网上的文件比较多；我使用的是next主题；参考的教程<http://theme-next.iissnan.com/getting-started.html>


