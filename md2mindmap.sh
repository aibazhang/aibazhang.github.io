#!/bin/bash

files=`find ./ -type f -name "*.md" ! -name "README.md" ! -path "./node_modules/*"`
mkdir -p ./html/tech ./html/nontech 

for file in $files;
do
  # tr
  output_file="${file/md/html}"
  echo "transforming $file to $output_file" && node_modules/.bin/markmap $file -o $output_file.html --no-open
done

list=`find ./html -type f -name "*.html" ! -name "index.html" | awk '{print "\""$0"\","}'`

# sed "s|HTML_FILE_LIST|$list|g" index.html.sample
awk -v list="$list" '{sub(/HTML_FILE_LIST/, list); print}' index.html.sample > index.html

# https://github.com/jpadfield/simple-site/blob/master/.github/workflows/build.yml