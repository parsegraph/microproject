#!/bin/bash
for try in `seq 1 3`; do
    yarn publish parsegraph-TODO-PACKAGE-NAME-dev.tgz --no-git-tag-version --prepatch --preid "$*" && exit
    echo "$try. Retrying..."
    sleep 3
done
exit 1
