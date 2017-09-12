#!/bin/bash

set -e

if [ $(which pdflatex) ]; then
    echo "Building your LaTeX files..."
    pdflatex -quiet -output-directory=pdf/ tex/*.tex
fi
