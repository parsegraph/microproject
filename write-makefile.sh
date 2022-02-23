#!/bin/bash
MICROPROJECT_DIR=$HOME/src/parsegraph/microproject
DEST_DIR=`pwd`
DIST_NAME=`basename $DEST_DIR`

SRC_DIRS="src test"

echo "DIST_NAME = $DIST_NAME"
echo

echo -n "SCRIPT_FILES = \"\$SCRIPT_FILES"
for srcdir in $SRC_DIRS; do
    for file in `find $srcdir -name '*.ts' -o -name '*.js' -o -name '*.jsx' -o -name '*.tsx'`; do
        echo " \\"
        echo -n -e "\t$file"
    done
done;
echo -e "\""
echo

echo -n "EXTRA_SCRIPTS = \"\$EXTRA_SCRIPTS"
for srcdir in $SRC_DIRS; do
    for file in `find $srcdir -name '*.glsl'`; do
        echo " \\"
        echo -n -e "\t$file"
    done
done
echo -e "\""
echo

echo "include ./Makefile.microproject"
