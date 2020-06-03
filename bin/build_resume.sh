#!/bin/bash
set -e

pdflatex -quiet -output-directory=docs/ docs/resume/*.tex
