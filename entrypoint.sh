#!/bin/bash

set -e

URL=$1
FUZZCOUNT="${2:-1}"
HEADERS="${3:-1}"

touch fuzz.txt

wget -q https://github.com/mprencipe/waggers/releases/download/v1.0.1/waggers-v1.0.1-linux-amd64.tar.gz
tar -xvf waggers-v1.0.1-linux-amd64.tar.gz
chmod 500 waggers

./waggers -dryrun=false -file=fuzz.txt -fuzzcount=$FUZZCOUNT -headers=$HEADERS $URL

echo "\n"
while IFS= read -r line; do
    if [[ $line == [5* ]]; then
        echo "Encountered internal server error: $line"
        exit 1
    fi
done < fuzz.txt
