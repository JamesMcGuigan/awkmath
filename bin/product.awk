#!/usr/bin/runawk
#
# product.awk - count entries in a single column of numbers
#

#use "../modules/isnumber.awk"


BEGIN { PRODUCT=1; }

isnumber($1) { PRODUCT *= $1; }

END { print PRODUCT }