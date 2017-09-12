#!/bin/bash

set -e

for i in rhymes/*; do
    if [[ ! "$i" == *".txt" && ! "$i" == *".html" && ! "$i" == *".asc" ]]; then
        echo Encrypting $i;
        gpg -a -e -r slava@allweretaken.xyz -o $i.asc $i && rm $i
    fi
done
