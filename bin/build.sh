#!/bin/bash

set -e

echo "Building your LaTeX files..."
#pdflatex -quiet -output-directory=pdf/ tex/*.tex

echo "Building your haikus..."
cd haiku/
rm index.html
while read -r line; do
    author=$(git show --format="%aN" $(git blame $line | head -n1 | cut -d" " -f 1) | head -n1)
    echo -e "<h3>$line by $author</h3>\n<embed src=\"$line\">" >> index.html
done <<< "$(while read file; do echo $(git log --pretty=format:%ad -n 1 --date=raw -- $file) $file; done < <(git ls-tree -r --name-only HEAD) | sort -k1,1n -r | cut -d" " -f 3)"
