#!/usr/bin/gawk -f
#
# sum.awk - sum of numeric entries in a single column
#

@include "isnumber.awk"


BEGIN { SUM=0; }

isnumber($1) { SUM += $1; }

END { print SUM }