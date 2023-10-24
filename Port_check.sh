#!/bin/bash

# Проверка существования файла
if [ ! -f /usr/local/bin/servers ]; then
    echo "Файл /usr/local/bin/servers не найден."
    exit 1
fi

# Чтение файла и проверка доступности порта
while IFS=: read -r ip port name; do
    result=$(nmap -p "$port" -T4 "$ip" | grep -o "open" || echo "closed")
    
    if [ "$result" = "open" ]; then
        status="1"
    else
        status="0"
    fi

    echo "availability,server=$ip,port=$port,nameserv=$name status=$status"
done < /usr/local/bin/servers
