#!/usr/bin/perl
##Copyright 2017 by Sarah Wang
#my $s = "I dream of a talent brain.";
#if ($s =~ /\bbra/){
#	print "bra founded!\n";
#}

#my $like = <STDIN> =~ /\bYES\b/i;
#print "like is $like\n";

#$text = <STDIN>;
#chomp $text;
#print "text is $text.";


#$var = undef;
#if ( defined($var) ) {
#	print "var is $var\n";
#	}else{
#		print "var is invalid\n";
#	}


#print "input the radius...";
#$r = <STDIN>;
#if ($r < 0) {
#	$l = 0;
#}else {
#	$pi = 3.141592654;
#	$l = 2*$pi*$r;
#}
#print "circle is ",$l,"\n";



#print "please input a string... ";
#$str = <STDIN>;
#print "please input the time you want to print... ";
#$n = <STDIN>;
#for ($i = 0; $i < $n; $i++){
#print $str;
#}


#while (<STDIN>){
#	print "I saw $_";
#}

#while (defined($_ = <STDIN>)) {
#	print "I saw $_";
#}

#./txtproc.pl file1.txt
#while(<>){
#	chomp;
#	print "it's $_ that I saw.\n";
#}

#@ARGV = qw# file1.txt file2.txt#;
#while(<>){
#	chomp;
#	print "it's $_ that I saw.\n";
#}


@array = qw/some good news/;
print @array;
print "=======";
print "@array";
print "\n";

#print <>; #相当于shell cat
#print sort <>; #相当于shell sort

print (2+3)*4;  #会输出5,因为print (2+3)被当做一个函数调用.
print "\n";

printf "%g %g %g\n", 5/2, 51/17, 51**17;
printf "%6d\n",34;
printf "%2d\n",4567;
printf "%7s\n", "abcdeefsgew";
printf "%12.4f\n", 3/4;

my @items = qw( happiness is possible! );
my $format = "The items are: \n" . ("%10s\n" x @items);
printf $format, @items;
printf "The items are:\n".("%10s\n" x @items), @items;

$_ = "hello, look, there, neighbor";
if (/\s([a-zA-Z]+),/) {
	print "the word was $1\n";
}

if (/(\S+) (\S+), (\S+)/) {
	print "words are $1 $2 $3\n";
}

my $msg = "ab";
if ($msg =~ /([0-9]+)/) {
	print "msg number is $1\n";
	}else{
		print "msg has no number\n";
	}

my $fruit = "apple banana orange";
#if (/(?:apple)? (strawberry|orange)/){
if (/(?:apple)? (orange)/) {
	print "I want a $1\n";
}

my $str = "sarah wants a banana";
if ($str =~ /(sarah)? wants a (orange|banana)/) {
	print "$1 want\n";
	print "$2 please!\n";
}

my $str = "sarah wants a banana";
if ($str =~ /(?:sarah) wants a (orange|banana)/) {
	print "$1 please!\n";
}

my $names = "Jon or Bob";
if ( $names =~ m/(\w+) (and|or) (\w+)/) {
print "I saw $1 and $3\n";
}

my $names = "Jone and Bob";
if ($names =~ /(?<name1>\w+) (and|or) (?<name2>\w+)/) {
	print "I see $+{name1} and $+{name2}\n";
}

my $names = "Jone Smith and Sarah White";
#if($names =~ /(?<lastname>\w+) (and|or) \w+ \g{lastname}/) {
#if($names =~ /(?<lastname>\w+) (and|or) \w+ \g<lastname>/) {
if($names =~ /(?<lastname>\w+) (and|or) \w+ /) {
	print "I see $+{lastname}\n";
}

#print "======\n";
my $var = "confident and elegant";
if ($var =~ /ele/) {
	print "original string: ($`)($&)($')\n";
}

print "======\n";
my $var = "confident and elegant";
if ($var =~ /ele/p) {
	print "original string: ($`)($&)($')\n";
	print "original string: (${^PREMATCH})(${^MATCH})(${^POSTMATCH})\n";
}

my $var = "lovely aaaaaaa girl";
if ($var =~ /a{4,5}/){
	print "$&\n";
}

#while (<>) {                   # take one input line at a time
#chomp;
	#if (/\w+a\z/) {
	#if (/(\w+a\z)/) {
#	if (/(?<pattern>\w+a\b)(.{0,5})/) {
#		print "Matched: |$`<$&>$'|\n";  # the special match vars
#		print "Matched: $1\n";
#		print "Matched: $+{pattern}\n";
#		print "Matched: $+{pattern}, $2 \n";
#	} else {
#		print "No match: |$_|\n";
#	}
#}

#while (<>) {
#	chomp;
#	if (/(\s\z)/){
#		print "Matched line: $`$&#\n";
#	}
#}

my $var = "you and me are not in the same world, aren't you?";
$var =~ s/(are|is)/\U$1/gi;
print "1 $var\n";
$var =~ s/(are)/\L$1/gi;
print "2 $var\n";
$var =~ s/(you|me)/\U$1aa/gi;
print "3 $var\n";
$var =~ s/(are)/\U$1\Eaa/gi;
print "4 $var\n";
$var =~ s/(and)/\u$1/gi;
print "5 $var\n";
$var =~ s/(you)/\l$1/gi;
print "6 $var\n";

my $name = "sarah wang";
print "Hello, \L\u$name\E, would like to go dancing?\n";

#my @fields = split /separator/, $string;
my @fields = split /:/, "you:are:supposed:to:be:connotative";
print @fields,"\n";
print "@fields\n";

my @fields = split /:/, "::you:connotative:::";
print "#@fields#\n";

my @fields = split /\s+/, "  \t1 2 3     4 5   \t";
print "1#@fields#\n";
my @fields = split /\s+/, " 1 2 3     4 5   \t";
print "2#@fields#\n";
my @fields = split /\s+/, "1 2 3     4 5   \t";
print "3#@fields#\n";

my @fields = split '', "you are going   to be   happy";
print "1#@fields#\n";
my @fields = split ' ', "   you are going   to be   happy  ";
print "2#@fields#\n";

my $x = "sarah:juzi";
my @names = split /:/, $x;
print "@names\n";
my $newx = join "-", @names;
print "$newx\n";

$_ = "hey, sarah and miky";
my($fir, $sec, $thr) = /(\S+), (\S+) and (\S+)/;
print "female: $sec; male: $thr\n";

my $text = "Mr. Han is one of the top 10 persons I am thankful to";
my @words = ($text =~ /([a-z]+)/ig);
print "@words\n";

my $data = "Betty David Herry Bob";
my %name = ($data =~ /(\w+)\s+(\w+)/g);
@bose = keys %name;
@worker = values %name;
print "bose: @bose\n";
print "worker: @worker\n";

$_ = "no matter what happened\nkeep strong\nkeep confident\nkeep loving yourself and your family";
print "found 'strong' at the end of line\n" if /\bstrong$/im;

open FILE, "file.txt"
	or die "can't open file.txt: $!";
my $line = join '',<FILE>;
$line =~ s/^/ps: /gm;
print "$line\n";

#$^I = "~";
#while (<>) {
#	s/(\w+)/\U$1/igm;
#	print "$_";
#}

my $what = "fred|bake";
my $input = "fredbakefredfred";
if ($input =~ /\b($what){3}\b/){
	print "$input\n";
	}else{
		print "not matched\n";
	}

#./txtproc.pl tmp
#$^I = ".out";
#while (<>) {
#	s/fred/FRED/ig;
#	s/larry/LARRY/ig;
#	s/FRED/larry/g;
#	s/LARRY/fred/g;
#	print "$_";
#}

#./txtproc.pl *.pl
#$^I = "~";
#while (<>){
	#s?^(#!/.*)?$1\n##Copyright 2017 by Sarah Wang?g;
	#s?^\^??g; #去掉^#!/bin/sh这种行行首的^
	#print "$_";

#}

#./txtproc.pl *.pl
#如果有版权声明,就不再加声明
#$^I = "~";
my $exist = 0;
while (<>){
	if (/^##Copyright 2017 by Sarah Wang/){
		$exist = 1;
		break;
	}
}
if ($exist == 0){
	$^I = "~";
	while (<VARG>){
		s?^(#!/.*)?$1\n##Copyright 2017 by Sarah Wang?g;
		print "$_";
	}
}

