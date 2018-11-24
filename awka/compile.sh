#!/usr/bin/env bash
cd $(readlink -f $(dirname $BASH_SOURCE[0])); cd ..;
mkdir -p ./awka/compile/
COMPILE=$(pwd -P)/awka/compile/;
rm -rvf $COMPILE;

FILES=$( find ./ -not \( -path ./awka -prune \) -name '*.awk' );
for FILE in $FILES; do
    TARGET=$(readlink -m "$COMPILE/$FILE.c")
    mkdir -p $(dirname $TARGET);
    ./awka/install/bin/awka -f $FILE > $TARGET
done
