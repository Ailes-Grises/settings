#!/usr/bin/perl

use strict;
use warnings;

for(my $i=0;$i<16;$i++){
	for(my $j=0;$j<16;$j++){
		my $color=16*$i+$j;
		printf("\x1b[38;5;".$color."m0x%03d",$color);
	}
	print "\n";
}
