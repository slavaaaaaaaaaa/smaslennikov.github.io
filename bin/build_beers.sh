#!/bin/bash

set -e

cd beers/

echo '<title>Beer Labels at smaslennikov.com</title>
<link rel="stylesheet" href="https://smaslennikov.com/assets/css/style.css?v=ff674011f1d18457583d29c73b81d4dffb14e488">
<a href="https://smaslennikov.com/beers/rss.xml"><img src="https://smaslennikov.com/rss.png" width=16 height=16 /></a> <a href="https://smaslennikov.com">Get me out of here</a><br />' > index.html

echo "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>
<rss version=\"2.0\">
<channel>
  <title>Slava Maslennikov - Beer Labels</title>
  <link>https://smaslennikov.com/beers</link>
  <description>Beer labels to drink at</description>
  <copyright>2017-2020 Slava Maslennikov. All rights reserved.</copyright>
" > rss.xml

while read -r file; do
    if [[ "$file" == *".jpg" ]] || [[ "$file" == *".png" ]] || [[ "$file" == *".gif" ]]; then
        name=$(echo "$file" | sed -e 's/_/ /g' -e 's/\..*//g')

        echo -e "<h4><a href=\"https://smaslennikov.com/beers/$file\">$name</h4><img src=\"$file\" height="100"></a>" >> index.html

        echo "
  <item>
    <title>$name</title>
    <link>https://smaslennikov.com/beers/$file</link>
    <description>$name</description>
  </item>" >> rss.xml
    fi
done <<< "$(while read file; do \
        echo $(git log --pretty=format:%ad -n 1 --date=raw -- $file) $file; \
    done < <(git ls-tree -r --name-only HEAD) | cut -d" " -f 3)"

echo "
</channel>
</rss>" >> rss.xml
