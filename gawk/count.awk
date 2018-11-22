#!/usr/bin/gawk -f
#
# count.awk - count numeric entries in a single column of numbers
#

@include "isnumber.awk"


BEGIN { COUNT=0; }

isnumber($1) { COUNT += 1; }

END { print COUNT }