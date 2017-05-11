package T;

require Exporter;
@ISA = qw/Exporter/;
@EXPORT = qw/function/;
#use Carp;
#use Carp qw(cluck);
use Carp;
sub function {
#   carp "Error in module!";
#	cluck "Error in module!";
#	croak "Error in module!";
	confess "Error in module!";
}
1; #包文件结尾返回1

