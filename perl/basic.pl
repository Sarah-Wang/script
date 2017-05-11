#!/usr/bin/perl
##Copyright 2017 by Sarah Wang
print "hello world\n";
#use 5.010
#say "hello world";
#print "hello world\n";
#
$datastring = localtime();
print "\$datastring= $datastring\n";

@months = qw(一月 二月 三月 四月 五月 六月 七月 八月 九月 十月 十一月 十二月);
@days = qw(星期天 星期一 星期二 星期三 星期四 星期五 星期六);

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
print "$sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst";
print "$mday $months[$mon] $days[$wday]\n";
#
$gmt_datestring = gmtime();
print "GMT 时间日期为：$gmt_datestring\n";

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();

printf("格式化时间：HH:MM:SS\n");
printf("%02d:%02d:%02d\n", $hour, $min, $sec);

$epoc = time();
print "从1970年1月1日起累计的秒数为：$epoc\n";

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
print "当期时间和日期：";
printf("%d-%d-%d %d:%d:%d",$year+1990,$mon+1,$mday,$hour,$min,$sec);

print "\n";

$epoc = time();
$epoc = $epoc - 24 * 60 * 60;   # 一天前的时间秒数
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($epoc);
print "昨天时间和日期：";
printf("%d-%d-%d %d:%d:%d",$year+1990,$mon+1,$mday,$hour,$min,$sec);

print "\n";

# 函数定义
sub Hello{
   print "Hello, World!\n";
}

# 函数调用
Hello();
#!/usr/bin/perl
##Copyright 2017 by Sarah Wang


# 定义求平均值函数
sub Average{
   # 获取所有传入的参数,子程序参数使用特殊数组 @_ 标明。
   $n = scalar(@_);
   $sum = 0;

   foreach $item (@_){
      $sum += $item;
   }
   $average = $sum / $n;
   print '传入的参数为 : ',"@_\n";           # 打印整个数组
   print "第一个参数值为 : $_[0]\n";         # 打印第一个参数
   print "传入参数的平均值为 : $average\n";  # 打印平均值
}

# 调用函数
Average(10, 20, 30);

# 定义函数
sub PrintList{
   my @list = @_;
   print "列表为 : @list\n";
}
$a = 10;
@b = (1, 2, 3, 4);

# 列表参数
PrintList($a, @b);

# 方法定义
sub PrintHash{
   my (%hash) = @_;

   foreach my $key ( keys %hash ){
      my $value = $hash{$key};
      print "$key : $value\n";
   }
}
%hash = ('name' => 'runoob', 'age' => 3);

# 传递哈希
PrintHash(%hash);

#如果没有使用 return 语句，则子程序的最后一行语句将作为返回值。
# 方法定义
sub add_a_b{
   # 不使用 return
   $_[0]+$_[1];

   # 使用 return
   # return $_[0]+$_[1];
}
print add_a_b(1, 2);


#默认情况下，Perl 中所有的变量都是全局变量，可以使用 my 操作符来设置私有变量。
#my 操作符用于创建词法作用域变量，通过 my 创建的变量，存活于声明开始的地方，直到闭合作用域的结尾。
#闭合作用域指的可以是一对花括号中的区域，可以是一个文件，也可以是一个 if, while, for, foreach, eval字符串。


sub somefunc{
   my $variable; # $variable 在方法 somefunc() 外不可见
   my ($another, @an_array, %a_hash); #  同时声明多个变量
}


#我们可以使用 local 为全局变量提供临时的值，在退出作用域后将原来的值还回去。
#local 定义的变量不存在于主程序中，但存在于该子程序和该子程序调用的子程序中。定义时可以给其赋值.
# 全局变量
$string = "Hello, World!";

sub PrintRunoob{
   # PrintHello 函数私有变量
   local $string;
   $string = "Hello, Runoob!";
   # 子程序调用的子程序
   PrintMe();
   print "PrintRunoob 函数内字符串值：$string\n";
}
sub PrintMe{
   print "PrintMe 函数内字符串值：$string\n";
}

sub PrintHello{
   print "PrintHello 函数内字符串值：$string\n";
}

# 函数调用
PrintRunoob();
PrintHello();
print "函数外部字符串值：$string\n";

#state操作符功能类似于C里面的static修饰符，state关键字将局部变量变得持久。
#state也是词法变量，所以只在定义该变量的词法作用域中有效.
#注1：state仅能创建闭合作用域为子程序内部的变量。
#注2：state是从Perl 5.9.4开始引入的，所以使用前必须加上 use。
#注3：state可以声明标量、数组、哈希。但在声明数组和哈希时，不能对其初始化（至少Perl 5.14不支持）。
use feature 'state';

sub PrintCount{
   state $count = 0; # 初始化变量

   print "counter 值为：$count\n";
   $count++;
}

for (1..5){
   PrintCount();
}

#引用就是指针，Perl 引用是一个标量类型可以指向变量、数组、哈希表（也叫关联数组）甚至子程序，可以应用在程序的任何地方。
#定义变量的时候，在变量名前面加个\，就得到了这个变量的一个引用，比如:
$scalarref = \$foo;     # 标量变量引用
$arrayref  = \@ARGV;    # 列表的引用
$hashref   = \%ENV;     # 哈希的引用
$coderef   = \&handler; # 子过程引用
$globref   = \*foo;     # GLOB句柄引用
#匿名数组引用
$aref= [ 1,"foo",undef,13 ];
my $aref = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
];
#匿名哈希引用，使用 {} 定义：
$href= { APR =>4, AUG =>8 };
#我们也可以创建一个没有子程序名的匿名子程序引用:
$coderef = sub { print "Runoob!\n" };
#取消应用可以根据不同的类型使用 $, @ 或 % 来取消，实例如下：

$var = 10;

# $r 引用 $var 标量
$r = \$var;

# 输出本地存储的 $r 的变量值
print "$var 为 : ", $$r, "\n";

@var = (1, 2, 3);
# $r 引用  @var 数组
$r = \@var;
# 输出本地存储的 $r 的变量值
print "@var 为: ",  @$r, "\n";

%var = ('key1' => 10, 'key2' => 20);
# $r 引用  %var 数组
$r = \%var;
# 输出本地存储的 $r 的变量值
print "%var 为 : ", %$r, "\n";

#如果你不能确定变量类型，你可以使用 ref 来判断，返回值列表如下，如果没有以下的值返回 false：
#SCALAR
#ARRAY
#HASH
#CODE
#GLOB
#REF
@var = (1, 2, 3);
$r = \@var;
print "r 的引用类型 : ", ref($r), "\n";

#函数引用格式: \&
#调用引用函数格式: & + 创建的引用名
# 函数定义
sub PrintHash{
   my (%hash) = @_;

   foreach $item (%hash){
      print "元素 : $item\n";
   }
}
%hash = ('name' => 'runoob', 'age' => 3);

# 创建函数的引用
$cref = \&PrintHash;

# 使用引用调用函数
&$cref(%hash);

my $foo = 100;
$foo = \$foo;
print "Value of foo is : ", $$foo, "\n";


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
