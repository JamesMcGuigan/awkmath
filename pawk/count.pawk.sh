#!/usr/bin/env bash
cd $(readlink -f $(dirname $BASH_SOURCE[0]));
source venv/bin/activate

# NOTE: float() will throw an exception if not numeric
pawk -B 'count=0' -E 'count' 'float(f[0]); count += 1'