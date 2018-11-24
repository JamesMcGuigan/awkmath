#!/usr/bin/env bash
cd $(readlink -f $(dirname $BASH_SOURCE[0]));
source venv/bin/activate

# NOTE: float() will throw an exception if not numeric
pawk \
-B 'product=1' \
'float(f[0]); product *= float(f[0])' \
-E 'int(product) if int(product) == float(product) else float(product)'


