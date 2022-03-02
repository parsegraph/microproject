#!/bin/bash
MICROPROJECT_DIR=$HOME/src/parsegraph/microproject
DEST_DIR=`pwd`
DIST_NAME=`basename $DEST_DIR`

SRC_DIRS="src test"

echo "DIST_NAME = $DIST_NAME"
echo

echo -n "SCRIPT_FILES ="
for srcdir in $SRC_DIRS; do
    if test -d $srcdir; then
        for file in `find $srcdir -name '*.ts' -o -name '*.js' -o -name '*.jsx' -o -name '*.tsx'`; do
            echo " \\"
            echo -n -e "\t$file"
        done
    fi
done
echo
echo

echo -n "EXTRA_SCRIPTS ="
for srcdir in $SRC_DIRS; do
    if test -d $srcdir; then
        for file in `find $srcdir -name '*.glsl' -o -name '*.css'`; do
            echo " \\"
            echo -n -e "\t$file"
        done
    fi
done
echo
echo

echo "include ./Makefile.microproject"
