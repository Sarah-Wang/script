#!/usr/bin/perl
##Copyright 2017 by Sarah Wang
#Perl 中打开文件可以使用以下方式：
	#open FILEHANDLE, EXPR
	#open FILEHANDLE
	#sysopen FILEHANDLE, FILENAME, MODE, PERMS
	#sysopen FILEHANDLE, FILENAME, MODE
#参数说明:
#FILEHANDLE：文件句柄，用于存放一个文件唯一标识符。
#EXPR：文件名及文件访问类型组成的表达式。
#MODE：文件访问类型。
#PERMS：访问权限位(permission bits)。

#读写模式
#< 或 r	只读方式打开，将文件指针指向文件头。
#> 或 w	写入方式打开，将文件指针指向文件头并将文件大小截为零。如果文件不存在则尝试创建之。
#>> 或 a	写入方式打开，将文件指针指向文件末尾。如果文件不存在则尝试创建之。
#+< 或 r+	读写方式打开，将文件指针指向文件头。
#+> 或 w+	读写方式打开，将文件指针指向文件头并将文件大小截为零。如果文件不存在则尝试创建之。
#+>> 或 a+	读写方式打开，将文件指针指向文件末尾。如果文件不存在则尝试创建之。

#PERMS 参数
#O_RDWR	读写方式打开，将文件指针指向文件头。
#O_RDONLY	只读方式打开，将文件指针指向文件头。
#O_WRONLY	写入方式打开，将文件指针指向文件头并将文件大小截为零。如果文件不存在则尝试创建之。
#O_CREAT	创建文件
#O_APPEND	追加文件
#O_TRUNC	将文件大小截为零
#O_EXCL	如果使用O_CREAT时文件存在,就返回错误信息,它可以测试文件是否存在
#O_NONBLOCK	非阻塞I/O使我们的操作要么成功，要么立即返回错误，不被阻塞。

open(DATA, "<file.txt") or die "file.txt 文件无法打开, $!";
open(DATA, ">file.txt") or die "file.txt 文件无法打开, $!";
#如果你需要以读写方式打开文件，可以在 > 或 < 字符前添加 + 号：
open(DATA, "+<file.txt") or die "file.txt 文件无法打开, $!";#这种方式不会删除文件原来的内容
open DATA, "+>file.txt" or die "file.txt 文件无法打开, $!";#这种方式会删除文件原来的内容
#如果要向文件中追加数据，则在追加数据之前，只需要以追加方式打开文件即可：
open(DATA,">>file.txt") || die "file.txt 文件无法打开, $!";
#如果需要读取要追加的文件内容可以添加 + 号：
open(DATA,"+>>file.txt") || die "file.txt 文件无法打开, $!";
while(<DATA>){
   print "$_";
}

sysopen(DATA, "file.txt", O_RDWR);
#如果需要在更新文件前清空文件，则写法如下：
sysopen(DATA, "file.txt", O_RDWR|O_TRUNC );

#close文件
	#close FILEHANDLE
	#FILEHANDLE 为指定的文件句柄，如果成功关闭则返回 true。
close(DATA) || die "无法关闭文件";

#print "菜鸟教程网址?\n";
#$name = <STDIN>; #从键盘输入
#print "网址：$name\n";

#读取多行文件,将每行当成一个元素放入数组中.
open(DATA,"<import.txt") or die "无法打开数据";
@lines = <DATA>;
print @lines;    # 输出数组内容
close(DATA);


#getc 函数从指定的 FILEHANDLE 返回单一的字符，如果没指定返回 STDIN：
#如果发生错误，或在文件句柄在文件末尾，则返回 undef。
#getc FILEHANDLE

#read 函数用于从缓冲区的文件句柄读取信息。这个函数用于从文件读取二进制数据。
#read FILEHANDLE, SCALAR, LENGTH, OFFSET
#read FILEHANDLE, SCALAR, LENGTH
#参数说明:
#	FILEHANDLE：文件句柄，用于存放一个文件唯一标识符。
#	SCALAR：开始读取位置。
#	LENGTH：读取的内容长度。
#	OFFSET：偏移量。
#	如果读取成功返回读取的字节数，如果在文件结尾返回 0，如果发生错误返回 undef。

#print 函数
#对于所有从文件句柄中读取信息的函数，在后端主要的写入函数为 print：
#	print FILEHANDLE LIST
#	print LIST
#	print
#利用文件句柄和 print 函数可以把程序运行的结果发给输出设备(STDOUT：标准输出)，例如：
print "Hello World!\n";

#文件拷贝
#以下实例我们将打开一个已存在的文件 file1.txt ，并读取它的每一行写入到文件 file2.txt 中：
# 只读方式打开文件
open(DATA1, "<file1.txt");
# 打开新文件并写入
open(DATA2, ">file2.txt");
# 拷贝数据
while(<DATA1>)
{
   print DATA2 $_;
}
close( DATA1 );
close( DATA2 );

#文件重命名,rename只对已经存在的文件重命名.
#以下实例，我们将已存在的文件 file1.txt 重命名为 file2.txt：
rename ("/usr/runoob/test/file1.txt", "/usr/runoob/test/file2.txt" );


#删除文件: unlink 函数来删除文件
unlink ("/usr/runoob/test/file1.txt");

#指定文件位置
	#tell 函数用于获取文件位置：
	#tell FILEHANDLE
	#tell
	#如果指定 FILEHANDLE 该函数返回文件指针的位置，以字节计。
	#如果没有指定则返回默认选取的文件句柄。

#	seek()函数是通过文件句柄来移动文件读写指针的方式来读取或写入文件的，以字节为单位进行读取和写入：
#	seek FILEHANDLE, POSITION, WHENCE
#	参数说明:
#	FILEHANDLE：文件句柄，用于存放一个文件唯一标识符。
#	POSITION：表示文件句柄(读写位置指针)要移动的字节数。
#	WHENCE：表示文件句柄(读写位置指针)开始移动时的起始位置，
#	可以取的值为0、1、2；分别表示文件开头、当前位置和文件尾。
#以下实例为从文件开头读取 256 个字节：
seek DATA, 256, 0;

#文件信息
my $file = "./import.txt";
my (@description, $size);
if (-e $file)
{
	push @description, '是一个二进制文件' if (-B _);
	push @description, '是一个socket(套接字)' if (-S _);
	push @description, '是一个文本文件' if (-T _);
	push @description, '是一个特殊块文件' if (-b _);
	push @description, '是一个特殊字符文件' if (-c _);
	push @description, '是一个目录' if (-d _);
	push @description, '文件存在' if (-x _);
	push @description, (($size = -s _)) ? "$size 字节" : '空';
	print "$file 信息：", join(', ',@description),"\n";
}

#Perl 目录操作
#以下列出了一些操作目录的标准函数：
#opendir DIRHANDLE, EXPR  # 打开目录
#readdir DIRHANDLE        # 读取目录
#rewinddir DIRHANDLE      # 定位指针到开头
#telldir DIRHANDLE        # 返回目录的当前位置
#seekdir DIRHANDLE, POS   # 定位指定到目录的 POS 位置
#closedir DIRHANDLE       # 关闭目录


# 显示 /tmp 目录下的所有文件
$dir = "/tmp/*";
my @files = glob( $dir );

foreach (@files ){
   print $_ . "\n";
}

# 显示 /tmp 和 /home 目录下的所有文件
$dir = "/tmp/* /home/*";
@files = glob( $dir );

foreach (@files ){
   print $_ . "\n";
}

#显示当前目录下所有文件
opendir (DIR, '.') or die "无法打开目录, $!";
while ($file = readdir DIR) {
  print "$file\n";
}
closedir DIR;

#切换目录
$dir = "/home";

# 将当期目录移动到 /home 目录下
chdir( $dir ) or die "无法切换目录到 $dir , $!";
print "你现在所在的目录为 $dir\n";

$dir="/home/sarah/mygit/scripts/perl";
chdir( $dir ) or die "无法切换目录到 $dir , $!";
print "你现在所在的目录为 $dir\n";


#创建目录
$dir = "./tmp";

# 创建/tmp目录或删除目录
#mkdir( $dir ) or die "无法创建 $dir 目录, $!";
#print "目录创建成功\n";
#rmdir( $dir ) or die "无法删除 $dir 目录, $!";
#print "目录删除成功\n";

#错误处理------------------------------------------
#die会中止程序,退出执行
$file="file.txt";
if(open(DATA, $file)){
	print "open successfully\n";
}else{
   die "Error: 无法打开文件 - $!";
}

open(DATA, $file) || die "Error: 无法打开文件 -$!";

#unless函数只有在表达式返回false时才会执行
unless(chdir("/etc")){
   die "Error: 无法打开目录 - $!";
}

die "Error: 无法打开目录!: $!" unless(chdir("/etc"));

print(exists($hash{value}) ? '存在' : '不存在',"\n");
#warn 函数用于触发一个警告信息，不会有其他操作，输出到 STDERR(标准输出文件)，通常用于给用户提示：
chdir('/etc') or warn "无法切换目录";
#die 函数类似于 warn, 但它会执行退出。一般用于错误信息的输出：
chdir('/etc') or die "无法切换目录";

#Carp 模块，它可以对产生的消息提供额外级别的控制，尤其是在模块内部。
#carp函数可以输出程序的跟踪信息，类似于 warn 函数，通常会将该信息发送到 STDERR：
#cluck() 与 warn() 类似，提供了从产生错误处的栈回溯追踪。
#croak() 与 die() 一样，可以结束脚本。
#confess() 与 die() 类似，但提供了从产生错误处的栈回溯追踪。
#use T;
#function();

#在迭代循环中，当前循环的字符串会放在 $_ 中, 然后 通过 print 输出。
#另外 print 在不指定输出变量，默认情况下使用的也是 $_
foreach ('Google','Runoob','Taobao') {
	print $_;
	print "\n";
}

#正则表达式
#perl处理完后会给匹配到的值存在三个特殊变量名:
#$`: 匹配部分的前一部分字符串
#$&: 匹配的字符串
#$': 还没有匹配的剩余字符串
$string = "welcome to runoob site.";
$string =~ m/run/;
print "匹配前的字符串: \"$`\"\n";
print "匹配的字符串: \"$&\"\n";
print "匹配后的字符串: \"$'\"\n";

$string = 'welcome to runoob site.';
$string =~ tr/a-z/A-z/;
print "$string\n";

$string = 'runoob'; #删除重复的字符
$string =~ tr/a-z/a-z/s;
print "$string\n";

$string = "i am a girl";
$string =~ tr/\t //d;     # 删除tab和空格
print "$string\n";

$string = "3run5oob2";
$string =~ tr/0-9/ /c;     # 把所有非数字字符替换为空格
print "$string\n";

$string = "45jo j90";
$string =~ tr/0-9/ /cs;    # 把数字间的其它字符替换为一个空格。
print "$string\n";

# 接收邮箱，这里我设置为我的 QQ 邮箱，你需要修改它为你自己的邮箱
$to = '429240967@qq.com';
#发送者邮箱
$from = 'test@runoob.com';
#标题
$subject = '菜鸟教程 Perl 发送邮件测试';
$message = '这是一封使用 Perl 发送的邮件。';

open(MAIL, "|/usr/sbin/sendmail -t");

# 邮件头部
print MAIL "To: $to\n";
print MAIL "From: $from\n";
print MAIL "Subject: $subject\n\n";
# 邮箱信息
print MAIL $message;

close(MAIL);
print "邮件发送成功\n";
