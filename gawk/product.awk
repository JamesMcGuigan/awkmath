#!/usr/bin/gawk -f
#
# product.awk - product of numeric entries in a single column
#

@include "isnumber.awk"


BEGIN { PRODUCT=1; }

isnumber($1) { PRODUCT *= $1; }

END { print PRODUCT }