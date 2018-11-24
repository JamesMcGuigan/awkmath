#!/usr/bin/env bash
cd $(readlink -f $(dirname $BASH_SOURCE[0]));
source venv/bin/activate

# NOTE: float() will throw an exception if not numeric
pawk \
-B '
count=0;
sum=0
' \
'
float(f[0]);
count += 1;
sum   += float(f[0])
' \
-E '
avg = sum/count if count != 0 else 0
int(avg) if int(avg) == float(avg) else float(avg)
'


