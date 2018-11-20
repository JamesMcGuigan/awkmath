#!/usr/bin/runawk
#
# count.awk - product of single column of numbers
#

#use "../modules/isnumber.awk"


BEGIN { COUNT=0; }

isnumber($1) { COUNT += 1; }

END { print COUNT }