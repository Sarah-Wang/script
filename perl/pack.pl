#!/usr/bin/perl
##Copyright 2017 by Sarah Wang
#perl 包的定义： package mypack;
#定义一个mypack包，此后定义的每个变量和函数都包含在该包相关联的符号表中。
#从一个包访问另外一个包中的变量，用" 包名 + 双冒号( :: ) + 变量名 "的方法指定
#默认储存在main包中
#

#  main 包
$i = 1;
print "包名 : " , __PACKAGE__ , " $i\n";

package Foo;
#  Foo 包
$i = 10;
print "包名 : " , __PACKAGE__ , " $i\n";

package main;
# 重新指定 main 包
$i = 100;
print "包名 : " , __PACKAGE__ , " $i\n";
print "包名: " , __PACKAGE__ ,  " $Foo::i\n";

1;

#Perl 中关于模块需要注意以下几点：
#函数 require 和 use 将载入一个模块。
#@INC 是 Perl 内置的一个特殊数组，它包含指向库例程所在位置的目录路径。
#require 和 use 函数调用 eval 函数来执行代码。
#末尾 1; 执行返回 TRUE，这是必须的，否则返回错误。

#BEGIN和END模块
#BEGIN { ... }
#END { ... }

#引用模块的两种方法： require，use
require Foo;
Foo::bar( "a" );
Foo::blat( "b" );

use Foo;
bar( "a" );
blat( "b" );

#二者的主要区别在于：
#1、require用于载入module或perl程序(.pm后缀可以省略，但.pl必须有)
#2、Perl use语句是编译时引入的，require是运行时引入的
#3、Perl use引入模块的同时，也引入了模块的子模块。而require则不能引入，要在重新声明
#4、USE是在当前默认的@INC里面去寻找,一旦模块不在@INC中的话,用USE是不可以引入的，但是require可以指定路径
#5、USE引用模块时，如果模块名称中包含::双冒号，该双冒号将作为路径分隔符，相当于Unix下的/或者Windows下的\。 如：
#use MyDirectory::MyModule


