#!/usr/bin/perl

$_ = "Cats are smarter than dogs";
if(/(.*) are (.*?) .*/){
	print "$1\n";
	print "$2\n";
}
