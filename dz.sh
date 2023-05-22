#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "Введите имя файла в качестве аргумента"
    exit 1
fi
input_file=$1
encrypted_file="$input_file.enc"
key_file="$input_file.key"
if [[ $# -eq 1 ]]; then
    md5sum "$input_file" | cut -d' ' -f1 > "$key_file"
    openssl enc -aes-256-cbc -salt -in "$input_file" -out "$encrypted_file"
    echo "Файл '$input_file' зашифрован и сохранен в '$encrypted_file'"
    echo "Ключ для расшифровки сохранен в '$key_file'"
    rm $input_file
    exit 0
fi
if [[ $# -eq 2 ]]; then
    key=$2
else
    key=$(cat "$key_file")
fi
if ! openssl enc -d -aes-256-cbc -salt -in "$encrypted_file" -out "$input_file" -pass "pass:$key" 2>/dev/null; then
    echo "Неверный ключ для расшифровки или файл '$encrypted_file' не существует"
    exit 1
fi
echo "Файл '$encrypted_file' расшифрован и сохранен в '$input_file'"
rm $encrypted_file
rm $key_file
