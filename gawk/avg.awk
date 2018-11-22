#!/usr/bin/env gawk
#
# avg.awk - mean average of numeric entries in a single column
#

@include "isnumber.awk"


BEGIN { COUNT=0; SUM=0; }

isnumber($1) { COUNT += 1; SUM += $1; }

END {
    if( COUNT == 0 ) { print 0; }
    else             { print SUM/COUNT; }
}