#!/bin/bash
chmod +x dz.sh

file=README.md
enc=$file.enc
key=$file.key 
pass=1234

./dz.sh $file $pass
if [[ -e $file && ! -e $enc && ! -e $key ]]
then
    echo "$file расшифровался"
    exit 0
else 
    echo "$file не расшифровался"
    exit 1
fi