#!/usr/bin/perl

$f1="/home/sarah/master/romfs/bin/conf_fixer";
$f2="/home/sarah/master/romfs/bin/peacock";
$f3="/home/sarah/master/romfs/bin/hostapd_cli";
$f4="/home/sarah/master/romfs/bin/record_widget";


#romfs/bin/del_sdcard_files
#romfs/bin/event_monitor
#romfs/bin/parrot


@n1=stat($f1);
@n2=stat($f2);
@n3=stat($f3);
@n4=stat($f4);

print "n1:  ## @n1 ##\n";
print "n2:  ## @n2 ##\n";
print "n3:  ## @n3 ##\n";
print "n4:  ## @n4 ##\n";
