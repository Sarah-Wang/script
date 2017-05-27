#!/usr/bin/perl
use feature 'state';
use 5.010;

sub greet{
	state @names;
	foreach my $name (@_){
		push @names, $name;
	}
	print "now names: @names\n";
	if ($#names = 0){
		print "Hi $names[0]! You are the first one come here.!\n";
	} else{
		print "Hi @names[-1]! @names[-2] is also here!\n";
	}
}

sub greet2{
	state @names;
	foreach my $name (@_){
		push @names, $name;
	}
	if ($#names = 0){
		print "Hi $names[0]! You are the first one come here.!\n";
	} else{
		print "Hi @names[-1]! I've seen : ";
		foreach $i (0..$#names-1){
			print "@names[$i] ";
		}
		print "\n";
	}
}

greet("Fred");
greet("Barney");
greet("sarah");

