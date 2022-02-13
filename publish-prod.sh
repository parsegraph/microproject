#!/bin/bash

PUBLISH="yarn publish parsegraph-method-prod.tgz --no-git-tag-version --patch"
$PUBLISH && exit
for try in `seq 1 3`; do
    sleep $try
    git checkout package.json
    $PUBLISH && exit
done
exit 1
