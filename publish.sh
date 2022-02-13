#!/bin/bash

run_number=$1
node_version=$2

for try in `seq 1 3`; do
    yarn publish parsegraph-TODO-PACKAGE-NAME-dev.tgz --no-git-tag-version --prepatch --preid "$run_number-$node_version" --tag=dev-$node_version && exit
    echo "$try. Retrying..."
    sleep 3
done
exit 1
