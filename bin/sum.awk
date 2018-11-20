#!/usr/bin/env runawk
#
# sum.awk - sum a single column of numbers
#

#use "../modules/isnumber.awk"


BEGIN { SUM=0; }

isnumber($1) { SUM += $1; }

END { print SUM }