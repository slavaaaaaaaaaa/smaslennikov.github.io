#!/bin/bash

set -e

cd rhymes/
indextmpfile=$(mktemp)
rsstmpfile=$(mktemp)

for file in *; do
    if [[ "$file" == *".txt" ]]; then
        name=$(echo $file | sed -e 's/.txt//' -e 's/_/ /g')
        author=$(git show --format="%aN" $(git blame $file | head -n1 | cut -d" " -f 1) | head -n1)
        date=$(git show --format="%ai" $(git blame $file | head -n1 | cut -d" " -f 1) | head -n1 | cut -d" " -f 1,2 | sed -e 's/ /T/')
        lines=$(cat $file | wc -l)
        height=$(printf %.$2f $(echo "-12.88393+28.79464*$lines-0.8779762*$lines^2+0.01488095*$lines^3" | bc))

        echo -e "hello the pizza is ready $date<h4><a href=\"https://github.com/smaslennikov/smaslennikov.github.io/blob/master/rhymes/$file\">$name</a> by $author on $date</h4><embed src=\"rhymes/$file\" height="$height" width=470>" >> $indextmpfile

        echo "
  <item>
    <title>$name</title>
    <link>https://github.com/smaslennikov/smaslennikov.github.io/blob/master/rhymes/$file</link>
    <description>$name by $author on $date</description>
  </item>" >> $rsstmpfile
    fi
done

cat <<EOF > ../_layouts/rhymes.html
---
layout: default
---

<a href="https://smaslennikov.com/rhymes/rss.xml"><img src="https://smaslennikov.com/rss.png" width=16 height=16 /></a> Rhymes and Haikus
EOF

cat <<EOF > rss.xml
<?xml version="1.0" encoding="UTF-8" ?>
<rss version="2.0">
<channel>
  <title>Slava Maslennikov - Haikus and Rhymes</title>
  <link>https://smaslennikov.com/rhymes</link>
  <description>I was a poet and I didn't even know I was one</description>
  <copyright>2017-2020 Slava Maslennikov. All rights reserved.</copyright>
EOF

sort -k6 -r $indextmpfile | sed -e 's/^.*<h4>/<h4>/g' | sed -e 's/\(....-..-..\)T\(.*\)/\1 \2/' -e 's/Z$//' >> ../_layouts/rhymes.html

cat $rsstmpfile >> rss.xml

cat <<EOF >> rss.xml
</channel>
</rss>
EOF
