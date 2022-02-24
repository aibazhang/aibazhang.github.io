#!/bin/bash

files=`find ./ -type f -name "*.md" ! -name "README.md"`
for file in ${files};
do
  echo "transforming ${file}" && docker run -it -v $(pwd):/work --rm nodejs-markmap markmap /work/${file}
done