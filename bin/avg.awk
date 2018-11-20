#!/usr/bin/env runawk
#
# avg.awk - average a single column of numbers
#

#use "../modules/isnumber.awk"


BEGIN { COUNT=0; SUM=0; }

isnumber($1) { COUNT += 1; SUM += $1; }

END {
    if( COUNT == 0 ) { print 0; }
    else             { print SUM/COUNT; }
}