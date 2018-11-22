#!/usr/bin/env runawk
#
# sum.awk - sum of numeric entries in a single column
#

#use "../modules/isnumber.awk"


BEGIN { SUM=0; }

isnumber($1) { SUM += $1; }

END { print SUM }