#!/usr/bin/awk -f
# seq 1 10 | sum.awk  # == 55


BEGIN { SUM=0; }

{ SUM += $1; }

END { print SUM }