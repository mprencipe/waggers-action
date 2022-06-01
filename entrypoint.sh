#!/bin/bash

URL=$1
FUZZCOUNT="${2:-1}"

cd /waggers

./waggers -dryrun=false -file=fuzz.txt -fuzzcount=$FUZZCOUNT $URL

echo "\n"
while IFS= read -r line; do
    if [[ $line == [5* ]]; then
        echo "Encountered internal server error: $line"
        exit 1
    fi
done < fuzz.txt
