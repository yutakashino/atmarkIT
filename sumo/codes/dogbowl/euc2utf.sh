#!/bin/sh

for i in "$@"
do
  echo $i
  iconv -f EUCJP -t UTF-8 $i > ${i}.utf8
  rm $i
  mv ${i}.utf8 $i
done
