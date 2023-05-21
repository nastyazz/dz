#!/bin/bash

chmod +x dz.sh
file=README.md
expect << EOF
spawn ./dz.sh README.md
send "1234\r"
send "1234\r"
expect eof
EOF


if [[ -e $file.enc && -e $file.key && ! -e $file ]]
then
    echo "Файлы $file.enc и $file.key существуют и $file удален"
    exit 0
else
    echo "Файлы $file.enc и $file.key не существуют и $file не удален"
    exit 1
fi