#!/bin/bash
if test $# -gt 0; then
    SITE_PORT=$1
    shift
fi
while true; do
    make demo SITE_PORT=$SITE_PORT &
    serverpid=$!
    trap 'kill -TERM $serverpid' TERM INT
    sleep 0.2
    inotifywait -e modify -r demo
    kill -TERM $serverpid
    sleep 0.2
done
