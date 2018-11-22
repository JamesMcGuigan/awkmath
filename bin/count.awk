#!/usr/bin/env runawk
#
# count.awk - count numeric entries in a single column of numbers
#

#use "../modules/isnumber.awk"


BEGIN { COUNT=0; }

isnumber($1) { COUNT += 1; }

END { print COUNT }