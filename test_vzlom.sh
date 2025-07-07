#!/bin/bash

protected_pdf="test_protected2.pdf"
dictionary="passwords.txt"

while IFS= read -r pass; do
    echo "Пробуем пароль: $pass"
    # Попытка расшифровать файл с паролем
    if qpdf --password="$pass" --decrypt "$protected_pdf" /dev/null > /dev/null 2>&1; then
        echo "Пароль найден: $pass"
        exit 0
    fi
done < "$dictionary"

echo "Пароль не найден в списке."
