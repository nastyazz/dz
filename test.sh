#!/bin/bash

filename=README.md
if [[ -f $filename ]]
then
    echo "Файл $filename существует, тест прошёл успешно"
    exit 0
else
    echo "Файл $filename отсутствует в папке, тест провален"
    exit 1
fi