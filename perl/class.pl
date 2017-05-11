#!/usr/bin/perl
##Copyright 2017 by Sarah Wang
#类的代码范围到脚本文件的最后一行，或者到下一个 package 关键字前。
#bless用来构造对象,把一个引用和这个类名相关联
#创建一个对象需要定义一个构造函数,子函数名字任意
package Person;
sub new
{
    my $class = shift;
    my $self = {
        _firstName => shift,
        _lastName  => shift,
        _ssn       => shift,
    };
    # 输出用户信息
    print "名字：$self->{_firstName}\n";
    print "姓氏：$self->{_lastName}\n";
    print "编号：$self->{_ssn}\n";
    bless $self, $class;
    return $self;
}
