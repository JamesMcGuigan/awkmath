#!/bin/bash
# SOURCE: https://stackoverflow.com/questions/6489995/can-you-use-heredocuments-to-embed-awk-in-a-bash-script
df | awk -f <(sed -e '0,/^#!.*awk/d' $0)
exit $PIPESTATUS

#!/usr/bin/awk -f
BEGIN {
    print "test"
}
{print $3}