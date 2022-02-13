#!/bin/bash

run_number=$1
node_version=$2

PUBLISH="yarn publish parsegraph-method-dev.tgz --no-git-tag-version --prepatch --preid "$run_number-$node_version" --tag=dev-$node_version"
$PUBLISH && exit
for try in `seq 1 3`; do
    sleep $try
    git checkout package.json
    $PUBLISH && exit
done
exit 1
