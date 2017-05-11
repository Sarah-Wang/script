#!/usr/bin/perl

package Foo;
sub bar {
   print "Hello $_[0]\n"
}

sub blat {
   print "World $_[0]\n"
}
1;

#Perl 中关于模块需要注意以下几点：
#函数 require 和 use 将载入一个模块。
#@INC 是 Perl 内置的一个特殊数组，它包含指向库例程所在位置的目录路径。
#require 和 use 函数调用 eval 函数来执行代码。
#末尾 1; 执行返回 TRUE，这是必须的，否则返回错误。
