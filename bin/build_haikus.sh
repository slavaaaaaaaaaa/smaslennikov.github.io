#!/bin/bash

set -e

echo "Building your haikus..."
cd rhymes/
tmpfile=$(mktemp)
while read -r line; do
    if [[ "$line" == *".txt" ]]; then
        name=$(echo $line | sed -e 's/.txt//' -e 's/_/ /')
        author=$(git show --format="%aN" $(git blame $line | head -n1 | cut -d" " -f 1) | head -n1)
        date=$(git show --format="%ai" $(git blame $line | head -n1 | cut -d" " -f 1) | head -n1 | cut -d" " -f 1,2 | sed -e 's/ /T/')
        echo -e "hello the pizza is ready $date<h4>$name by $author on $date</h4><embed src=\"$line\" height="$(echo "$(cat $line | wc -l)*26" | bc)" width=370>" >> $tmpfile
    fi
done <<< "$(while read file; do echo $(git log --pretty=format:%ad -n 1 --date=raw -- $file) $file; done < <(git ls-tree -r --name-only HEAD) | cut -d" " -f 3)"

sort -k6 -r $tmpfile | sed -e 's/^.*<h4>/<h4>/g' | sed -e 's/\(....-..-..\)T\(.*\)/\1 \2/' -e 's/Z$//' > index.html
