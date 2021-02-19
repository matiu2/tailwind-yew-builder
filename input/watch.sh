#!/bin/sh
files="input/tailwind.css input/tailwind.config.js $(find source_code/src -type d)  $(find source_code/src -type f -name '*.rs') source_code/index.html"
echo waiting for changes in these files: $files
while IFS= inotifywait $files
do
    cd /work && /bin/sh prod.sh
done
