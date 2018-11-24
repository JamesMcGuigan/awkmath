#!/usr/bin/env bash
cd $(readlink -f $(dirname $BASH_SOURCE[0]))
ROOT=`pwd -P`/install/

mkdir -p ./install/src/; cd ./install/src/;
wget -c https://master.dl.sourceforge.net/project/awka/awka-0.7.5.tar.gz
tar -xvzf awka-0.7.5.tar.gz
cd ./awka-0.7.5/
./configure --prefix=$ROOT/
make
make install
