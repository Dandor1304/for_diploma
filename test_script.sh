#!/bin/bash

# Вывод отладочной информации
echo "Скрипт запущен"

for i in {1..10}; do
    current_time=$(date +%s.%N)
    echo "Текущее время: $current_time"

    sudo kubectl apply -f req_pod.yaml
    echo "Под запущен"
    sleep 5

    #sudo kubectl delete -f req_pod.yaml
    echo "Под удален"
    sleep 5
done


