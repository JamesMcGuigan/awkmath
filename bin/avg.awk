#!/usr/bin/awk -f
# seq 1 10 | sum.awk  # == 5.5


BEGIN { COUNT=0; SUM=0; }

{ COUNT += 1; SUM += $1; }

END { print SUM/COUNT }