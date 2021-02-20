#!/bin/sh

wait_for_changes() {
    FILES="input/tailwind.css input/tailwind.config.js $(find source_code/src -type d)  $(find source_code/src -type f -name '*.rs') source_code/index.html"
    echo
    echo Waiting for changes in these files: $FILES
    inotifywait $FILES
}

while :
do
    wait_for_changes
    cd /work && /bin/sh prod.sh
done
