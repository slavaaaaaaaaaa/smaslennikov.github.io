#!/bin/bash

set -e

if [ $(which pdflatex) ]; then
    echo "Building your LaTeX files..."
    pdflatex -quiet -output-directory=pdf/ tex/*.tex
fi

echo "Building your haikus..."
cd haiku/
rm index.html
while read -r line; do
    if [ ! "$line" == "index.html" ]; then
        name=$(echo $line | sed -e 's/.txt//')
        author=$(git show --format="%aN" $(git blame $line | head -n1 | cut -d" " -f 1) | head -n1)
        echo -e "<h3>$name by $author</h3><embed src=\"$line\" height="70">" >> index.html
    fi
done <<< "$(while read file; do echo $(git log --pretty=format:%ad -n 1 --date=raw -- $file) $file; done < <(git ls-tree -r --name-only HEAD) | sort -k1,1n -r | cut -d" " -f 3)"
