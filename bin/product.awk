#!/usr/bin/awk -f
# seq 1 10 | product.awk  # == 3628800


BEGIN { PRODUCT=1; }

{ PRODUCT *= $1; }

END { print PRODUCT }