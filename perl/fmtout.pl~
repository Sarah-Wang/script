#!/usr/bin/perl
###Copyright 2017 by Sarah Wang
#Perl 格式化定义语法格式如下：
#format FormatName =
#fieldline
#value_one, value_two, value_three
#fieldline
#value_one, value_two
#.

#格式变量
#$~ ($FORMAT_NAME) ：格式名字
#$^ ($FORMAT_TOP_NAME) ：当前的表头格式名字存储在
#$% ($FORMAT_PAGE_NUMBER) ：当前输出的页号
#$= ($FORMAT_LINES_PER_PAGE) ：每页中的行数
#$| ($FORMAT_AUTOFLUSH) ：是否自动刷新输出缓冲区存储
#$^L ($FORMAT_FORMFEED) ：在每一页(除了第一页)表头之前需要输出的字符串存储在
$text = "google runoob taobao";
format STDOUT =
first: ^<<<<<  # 左边对齐，字符长度为6
    $text
second: ^<<<<< # 左边对齐，字符长度为6
    $text
third: ^<<<< # 左边对齐，字符长度为5，taobao 最后一个 o 被截断
    $text
.
write;


format EMPLOYEE =
===================================
@<<<<<<<<<<<<<<<<<<<<<< @<<
$name $age
@#####.##
$salary
===================================
.

select(STDOUT);
$~ = EMPLOYEE;

@n = ("Ali", "Runoob", "Jaffer");
@a  = (20,30, 40);
@s = (2000.00, 2500.00, 4000.000);

$i = 0;
foreach (@n){
	$name = $_;
	$age = $a[$i];
	$salary = $s[$i++];
	write;
}

$~ = "MYFORMAT"; # 指定缺省文件变量下所使用的格式
write;           # 输出 $~ 所指定的格式

format MYFORMAT = # 定义格式 MYFORMAT
=================================
      Text # 菜鸟教程
=================================
.
write;


#---------------------------------------
format STDOUT =
~用~号指定的文字不会被输出
----------------
  STDOUT格式
----------------
.

write;         # 不指定$~的情况下会寻找名为STDOUT的格式



#输出表头---------------------------------------
format EMPLOYEE =
===================================
@<<<<<<<<<<<<<<<<<<<<<< @<<
$name $age
@#####.##
$salary
===================================
.

format EMPLOYEE_TOP =
===================================
Name                    Age
===================================
.

select(STDOUT);
$~ = EMPLOYEE;
$^ = EMPLOYEE_TOP;

@n = ("Ali", "Runoob", "Jaffer");
@a  = (20,30, 40);
@s = (2000.00, 2500.00, 4000.000);

$i = 0;
foreach (@n){
   $name = $_;
   $age = $a[$i];
   $salary = $s[$i++];
   write;
}


#输出到其他文件,write(filename)-------------------
if (open(MYFILE, ">tmp")) {
$~ = "MYFORMAT";
write MYFILE; # 含文件变量的输出，此时会打印与变量同名的格式，即MYFILE。$~里指定的值被忽略。

format MYFILE = # 与文件变量同名
=================================
      输入到文件中
=================================
.
close MYFILE;
}


if (open(MYFILE, ">>tmp")) {
select (MYFILE); # 使得默认文件变量的打印输出到MYFILE中
$~ = "OTHER";
write;           # 默认文件变量，打印到select指定的文件中，必使用$~指定的格式 OTHER

format OTHER =
=================================
  使用定义的格式输入到文件中
=================================
.
close MYFILE;
}

