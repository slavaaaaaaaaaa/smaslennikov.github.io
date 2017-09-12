#!/bin/bash

set -e

for i in rhymes/*; do
    if [[  "$i" == *".asc" ]]; then
        echo Decrypting $i in place;
        gpg -d $i
    fi
done
