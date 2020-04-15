#!/usr/bin/perl
##Copyright 2017 by Sarah Wang
use 5.010;
use feature 'state';
print "12fred34" * 2;
print 'hello\n###';
print 'hello\\n###';
print 'don\'t know\n';
print "hello world\n";
print "hello"."you"."here"."\n";
print "sarah"x3;
print "good" x 2.6;
print "ha" x (1+2);
print 6.5/808;

@array = qw(pebbles dino fred barney betty);
@remove = splice @array, 2;
print "1 array: @array\n";
print "1 remove: @remove\n";

@array = qw(pebbles dino fred barney betty);
@remove = splice @array, 1, 2;
print "2 array: @array\n";
print "2 remove: @remove\n";

@array = qw(pebbles dino fred barney betty);
@remove = splice @array, 1, 2, qw(wilma);
print "3 array: @array\n";
print "3 remove: @remove\n";

@array = qw(pebbles dino fred barney betty);
@remove = splice @array, 1, 0, qw(wilma);
print "4 array: @array\n";
print "4 remove: @remove\n";

@rocks = qw{flintstone slate rubble};
print "quartz #@rocks# limestone\n";

@fred = qw{being unhappy is wrong};
$fred = "right";
print "$fred[3]\n";
print "${fred}[3]\n";
print "$fred"."[3]\n";
print "$fred\[3]\n";

@fred = qw{being unhappy is wrong};
foreach $item (@fred) {
	#print "$item\n";
	$item = $item."new";
}
print "@fred\n";

print "\$_ is: $_\n";
foreach (1..10){
	print "count to $_\n";
}
print "\$_ is: $_\n";

@array = 3..6;
@arrnew = reverse(@array);
print "new array: @arrnew\n";
@wilma = reverse 3..6;
print "wilma: @wilma\n";
@fred = 1..4;
@fred = reverse @fred;
print "fred: @fred\n";

@rocks = qw/ bedrock slate rubble granite /;
@sorted = sort @rocks;
print "sorted: @sorted\n";
@back = reverse sort @rocks;
print "back: @back\n";
@rocks = sort @rocks;
print "rocks: @rocks\n";
@numbers = sort 98..103;
print "numbers: @numbers\n";

my @rocks = qw/ bedrock slate rubble granite /;
while ( my($index, $value) = each @rocks ) {
	print "$index: $value\n";
}

foreach $index (0 .. $#rocks ){
	print "$index: @rocks[$index]\n";
}

@people = qw( fred barney betty );
@sorted = sort @people;
print "sorted: @sorted\n";
$num = 13 + @people; #here, @people is length of array
print "num = $num\n";

$backwards = reverse qw/ bedrock slate rubble granite /;
print "backwards: $backwards\n";

#this is useful, but not good for test
#to use it, delete @code = qw{};
@code = qw{
chomp( @input = <STDIN> );
@input = reverse @input;
print "input is: @input\n";

@list = qw/sarah july petty/;
while (chomp ($line = <STDIN>)){
	print "@list[$line-1]\n";
}

chomp(@input = <STDIN>);
@input = sort @input;
print "@input\n";
while ( my($index, $value) = each @input ){
	print "$value\n";
}

};

sub max {
	if (@_ != 2){
		warn "the number of params is not 2.\n";
	}
	my($m, $n) = @_;
	if ($m > $n) {$m;} else {$n;}
}

$n = &max(10, 15);
print "max: $n\n";


sub maxBest {
	my $max = shift @_;
	foreach (@_) {
		if ($_ > $max) {
			$max = $_;
		}
	}
	$max;
}

$n = &maxBest(10, 15, 30, 2);
print "max: $n\n";

sub give_list{
	($start, $end) = @_;
	if ($start < $end){
		$start..$end;
	}else{
		reverse $end..$start;
	}
}

@list = give_list(8,4);
print "list: @list\n";

#this is a code
#use 5.010;
@statetest = qw/
&running_sum(5,6);
&running_sum(1..3);
&running_sum(4);

sub running_sum{
	state $sum = 0;
	state @numbers;
	foreach my $number (@_) {
		push @numbers, $number;
		$sum += $number;
	}

	print "The sum of (@numbers) is $sum\n";
}
/;


sub total{
	@nums = @_;
	$sum = 0;
	foreach $i (@nums){
		$sum = $sum + $i;
	}
	$sum;
}

sub avarage{
	@nums = @_;
	$tol = total(@nums);
	$ava = $tol/($#nums + 1);
}

$tol = total(qw/1 2 3/);
print "tol: $tol\n";
$ava = avarage(qw/1 2 3/);
print "ava: $ava\n";

$tol2 = total(1..1000);
print "tol2: $tol2\n";
$ava2 = avarage(1..1000);
print "ava2: $ava2\n";


%data = ('google', 'google.com', 'runoob', 'runoob.com', 'taobao', 'taobao.com');

print "\$data{'google'} = $data{'google'}\n";
print "\$data{'runoob'} = $data{'runoob'}\n";
print "\$data{'taobao'} = $data{'taobao'}\n";

%data = ('google'=>'google.com', 'runoob'=>'runoob.com', 'taobao'=>'taobao.com');

%data = (google=>'google.com', runoob=>'runoob.com', taobao=>'taobao.com');
$data{'google'} = 'google.com';
$data{'runoob'} = 'runoob.com';
$data{'taobao'} = 'taobao.com';

@data_array = %data;
print "hash to array: @data_array\n";

my %new_data = reverse %data;
@new_array = %new_data;
print "hash after reverse: @new_array\n";

my @mykeys = keys %data;
my @myvals = values %data;
print "mykeys: @mykeys\n";
print "myvals: @myvals\n";

my $mykeys = keys %data;
my $myvals = values %data;
print "mykeys: $mykeys\n";
print "myvals: $myvals\n";


#use 5.010
#say "hello world";
#print "hello world\n";
#
$datastring = localtime();
print "\$datastring= $datastring\n";

@months = qw(一月 二月 三月 四月 五月 六月 七月 八月 九月 十月 十一月 十二月);
@days = qw(星期天 星期一 星期二 星期三 星期四 星期五 星期六);

print "\$_ is: $_\n";
foreach (1..10){
	print "count to $_\n";
}
print "\$_ is: $_\n";

@array = 3..6;
@arrnew = reverse(@array);
print "new array: @arrnew\n";
@wilma = reverse 3..6;
print "wilma: @wilma\n";
@fred = 1..4;
@fred = reverse @fred;
print "fred: @fred\n";

@rocks = qw/ bedrock slate rubble granite /;
@sorted = sort @rocks;
print "sorted: @sorted\n";
@back = reverse sort @rocks;
print "back: @back\n";
@rocks = sort @rocks;
print "rocks: @rocks\n";
@numbers = sort 98..103;
print "numbers: @numbers\n";

my @rocks = qw/ bedrock slate rubble granite /;
while ( my($index, $value) = each @rocks ) {
	print "$index: $value\n";
}

foreach $index (0 .. $#rocks ){
	print "$index: @rocks[$index]\n";
}

@people = qw( fred barney betty );
@sorted = sort @people;
print "sorted: @sorted\n";
$num = 13 + @people; #here, @people is length of array
print "num = $num\n";

$backwards = reverse qw/ bedrock slate rubble granite /;
print "backwards: $backwards\n";

#this is useful, but not good for test
#to use it, delete @code = qw{};
@code = qw{
chomp( @input = <STDIN> );
@input = reverse @input;
print "input is: @input\n";

@list = qw/sarah july petty/;
while (chomp ($line = <STDIN>)){
	print "@list[$line-1]\n";
}

chomp(@input = <STDIN>);
@input = sort @input;
print "@input\n";
while ( my($index, $value) = each @input ){
	print "$value\n";
}

};

sub max {
	if (@_ != 2){
		warn "the number of params is not 2.\n";
	}
	my($m, $n) = @_;
	if ($m > $n) {$m;} else {$n;}
}

$n = &max(10, 15);
print "max: $n\n";

sub maxBest {
	my $max = shift @_;
	foreach (@_) {
		if ($_ > $max) {
			$max = $_;
		}
	}
	$max;
}

$n = &maxBest(10, 15, 30, 2);
print "max: $n\n";

sub give_list{
	($start, $end) = @_;
	if ($start < $end){
		$start..$end;
	}else{
		reverse $end..$start;
	}
}

@list = give_list(8,4);
print "list: @list\n";

#this is a code
#use 5.010;
@statetest = qw/
&running_sum(5,6);
&running_sum(1..3);
&running_sum(4);

sub running_sum{
	state $sum = 0;
	state @numbers;
	foreach my $number (@_) {
		push @numbers, $number;
		$sum += $number;
	}

	print "The sum of (@numbers) is $sum\n";
}
/;


sub total{
	@nums = @_;
	$sum = 0;
	foreach $i (@nums){
		$sum = $sum + $i;
	}
	$sum;
}

sub avarage{
	@nums = @_;
	$tol = total(@nums);
	$ava = $tol/($#nums + 1);
}

$tol = total(qw/1 2 3/);
print "tol: $tol\n";
$ava = avarage(qw/1 2 3/);
print "ava: $ava\n";

$tol2 = total(1..1000);
print "tol2: $tol2\n";
$ava2 = avarage(1..1000);
print "ava2: $ava2\n";


%data = ('google', 'google.com', 'runoob', 'runoob.com', 'taobao', 'taobao.com');

print "\$data{'google'} = $data{'google'}\n";
print "\$data{'runoob'} = $data{'runoob'}\n";
print "\$data{'taobao'} = $data{'taobao'}\n";

%data = ('google'=>'google.com', 'runoob'=>'runoob.com', 'taobao'=>'taobao.com');

%data = (google=>'google.com', runoob=>'runoob.com', taobao=>'taobao.com');
$data{'google'} = 'google.com';
$data{'runoob'} = 'runoob.com';
$data{'taobao'} = 'taobao.com';

@data_array = %data;
print "hash to array: @data_array\n";

my %new_data = reverse %data;
@new_array = %new_data;
print "hash after reverse: @new_array\n";

my @mykeys = keys %data;
my @myvals = values %data;
print "mykeys: @mykeys\n";
print "myvals: @myvals\n";

my $mykeys = keys %data;
my $myvals = values %data;
print "mykeys: $mykeys\n";
print "myvals: $myvals\n";


while ( ($key, $value) = each %data ){
	print "$key => $value\n";
}

foreach $key (sort keys %data){
	print "$key: $data{$key}\n";
}

#如果哈希没有某个键，则其值为undef。
print "yahoo: $data{yahoo}\n";

delete $data{taobao};
if (exists $data{taobao}){
	print "taobao is a key\n";
}else{
	print "taobao is not a key\n";
}

my $maxlen=0;
foreach $envar (sort keys %ENV){
	$maxlen = $maxlen > length($envar) ? $maxlen : length($envar);
}
foreach $envar (sort keys %ENV){
	printf "%-${maxlen}s\t%s\n",$envar,$ENV{$envar};
}

%name = (sarah=>"wang", wil=>"shi", tony=>"nie");
#chomp($name2qry = <STDIN>);
$name2qry = "tony";
print "firtname is $name{$name2qry}\n";

my $list;
if(! open $list, '<', "words.txt"){
	die "open words.txt failed\n";
}
my %words;
while ( <$list> ){
	chomp;
	$words{$_} += 1;
}
foreach $key (keys %words){
	print "$key: $words{$key}\n";
}

my $feeling = "not_bad";
unless($feeling =~ /good/){
	print "she was not good now.\n";
}

$j=3;
$i=5;
until($j > $i){
	printf "$j > $i is false\n";
	$j++;
}

print "hello \n" if 5>4;
print "world\n" unless 3>7;
$num=3;
print "stop $num\n" while ($num--);
print "item $_\n" foreach (5..7);

{
	my $alef = chr(0x05D0);
	my $alpha = chr(hex('03b1'));
	my $omega = chr(0x03c9);
	my $code = ord('?');
	print "$alef$alpha$omega\n";
	print "? code = $code\n";
	print "other form: \x{03b1}\n";
}

#$mess = "";
if (! defined $mess){
	print "\$mess was not defined\n";
}elsif($mess =~ /^-?\d+.?$/){
	print "\$mess is a integer\n";
}elsif($mess =~ /^-?\d+.\d+$/){
	print "\$mess is a float number\n";
}elsif ($mess eq ''){
	print "\$mess is a empty string\n";
}else{
	print "mess is a string '$mess'\n";
}

@people = qw( sarah lily tom sarah tom july );
%count;
$count{$_}++ foreach @people;
print "$_: $count{$_}\n" foreach (keys %count);

for(1..3){
	print "$_\n";
}
foreach(1..3){
	print "$_\n";
}


@not_comment = qw{
	my $myfile;
	die "open file failed!\n" if (! open $myfile, '<', 'words.txt');
	while (<$myfile>){
	foreach (split){
		$total++;
		next if /\W/;
		$valid++;
		$count{$_}++;
	}
	}
	print "total segments: $total; total words: $valid\n";
	foreach $word (keys %count){
	print "$word has been seen for $count{$word} times\n";
	}

};

print "\n";

my $myfile;
die "open file failed!\n" if (! open $myfile, '<', 'words.txt');
LINE: while (<$myfile>){
WORD: foreach (split){
	$total++;
	last LINE if /__END__/;
	next WORD if /\W/;
	$valid++;
	$count{$_}++;
	}
}
print "total segments: $total; total words: $valid\n";
foreach $word (keys %count){
print "$word has been seen for $count{$word} times\n";
}

foreach (1..10){
	print "now at $_\n";
	print "please select mode: last, next ,redo or none of the above\n";
	#chomp($mode = <STDIN>);
	$mode = "last";
	print "\n";
	last if $mode =~ /last/i;
	next if $mode =~ /next/i;
	redo if $mode =~ /redo/i;
	print "bad choice！ Go forward!\n";
}

my $average = $whonos ? 100/$whonos : "----";
print "average = $average\n";

$wid = 60;
my $size =
($wid < 10) ? "small" :
($wid < 20) ? "medium" :
($wid < 50) ? "large" : "extra-large";
print "size = $size\n";

foreach my $try (0, '0', undef, 1, "b"){
print "trying [$try] --> ";
my $value = $try // 'default';
print "\tgot [$value]\n";
#printf "\tgot [%s]\n",$value // ''; #没有定义时用空字符串代替
}
print "\n";


sub guess{
my $bingo = int(1+rand100);
while (1){
	print "Please input a number\n";
	my $num = <STDIN>;
	chomp;
	last if $num =~ /(quit)|(exit)|^$/;
	if ($num > $bingo) {
		print "too high\n" if $num > $bingo;
		redo;
	}elsif ($num < $bingo){
		print "too low\n" if $num < $bingo;
		redo;
	}else{
		print "Congratulations!\n";
		last;
	}
}
}
&guess;
