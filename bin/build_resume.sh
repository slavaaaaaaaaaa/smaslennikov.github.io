#!/bin/bash

set -e

echo "Building your LaTeX files..."

if [ $(which pdflatex) ]; then
    pdflatex -quiet -output-directory=. tex/*.tex
elif [ -e /Library/TeX/Root/bin/x86_64-darwin/pdflatex ]; then
    /Library/TeX/Root/bin/x86_64-darwin/pdflatex -quiet -output-directory=. tex/*.tex
else
    echo "You don't have pdflatex installed!"
    exit 1
fi
