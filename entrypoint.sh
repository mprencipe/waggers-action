#!/bin/bash

cd /waggers

./waggers -dryrun=false -file=fuzz.txt $1

echo "\n"
while IFS= read -r line; do
    if [[ $line == [5* ]]; then
        echo "Encountered internal server error: $line"
        exit 1
    fi
done < fuzz.txt
