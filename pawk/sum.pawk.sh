#!/usr/bin/env bash
cd $(readlink -f $(dirname $BASH_SOURCE[0]));
source venv/bin/activate

# NOTE: float() will throw an exception if not numeric
pawk \
-B 'sum=0' \
'float(f[0]); sum += float(f[0])' \
-E 'int(sum) if int(sum) == float(sum) else float(sum)'


