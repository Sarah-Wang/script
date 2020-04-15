#!/usr/bin/perl
use File::Basename;
use File::Spec;
use DateTime;

my $name="/home/sarah/free";
my $basename=basename $name;
my $dirname=dirname $name;
$basename =~ s/^/not/;
#print "$basename\n";
my $new_name = File::Spec->catfile($dirname, $basename);
print "$new_name\n";

my $dt = DateTime->from_epoch(epoch => time);
printf "4d%-02d-%02d\n",$dt->year, $dt->month, $dt->day;
printf "%4d%02d%02d\n",$dt->year, $dt->month, $dt->day;
print $dt->ymd,"\n";
print $dt->ymd('/'),"\n";
print $dt->ymd(''),"\n";

my $dt1 = DateTime->new(
	year => 1987,
	month => 12,
	day => 18,
);
my $dt2 = DateTime->new(
	year => 2011,
	month => 5,
	day => 1,
);
my $duration = $dt2 - $dt1;
my @units = $duration->in_units(qw(year month day));
printf "%4d years %02d months %02d days\n", @units;

#use 5.010;
if (-r -w -x -o -d "/home/sarah") {
	print "my home directory is rwx!\n";
}

#@ARGV stores the parameters after program name
my @files=@ARGV;
my $oldfile;
my $time = 0;
foreach my $file (@files){
	#print "$file\n";
	#print "$file is rwx\n" if -r -w -x -e $file;
	$t = -M $file;
	if ( $t > $time ){
		$oldfile = $file;
		$time = $t;
	}
}
if( @files == ()){
	print "nothing to do\n";
	}else{
	print "$oldfile has existed for $time days!\n";
	}

