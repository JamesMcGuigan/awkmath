#!/usr/bin/awk -f
# seq 1 10 | count.awk  # == 10


BEGIN { COUNT=0; }

{ COUNT += 1; }

END { print COUNT }