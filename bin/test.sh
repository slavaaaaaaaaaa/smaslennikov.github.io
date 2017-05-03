#!/bin/bash
set -e

pdflatex --version
pdftotext -v

for i in tex/*.tex; do
    newpdf=$(echo $i | sed -e 's%^.*/%%' -e 's/tex/pdf/g')
    oripdf=$(echo $i | sed 's/tex/pdf/g')

    pdflatex $i

    if [[ $(stat -c%s $newpdf) -ne $(stat -c%s $oripdf) ]]; then
        echo "There are unbuilt .tex files!"
        echo "---"
        stat -c%s $newpdf
        echo "---"
        stat -c%s $oripdf
        exit 1
    fi

    # weird old ubuntu version of tex live makes this impossible
    #pdftotext $newpdf one.txt && pdftotext $oripdf two.txt
    #if [[ $(diff one.txt two.txt) ]]; then
    #    echo "There are unbuilt .tex files!"
    #    echo "---"
    #    diff one.txt two.txt
    #    exit 1
    #fi
done
