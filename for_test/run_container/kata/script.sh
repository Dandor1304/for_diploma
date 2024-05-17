#!/bin/bash
namepod="Podrunkata"
for i in {1..10}; do
    current_time_1=$(date +%s.%N)
    kubectl apply -f $namepod.yaml
    current_time_2=$(date +%s.%N)
    sleep 15
    current_time_3=$(kubectl exec timestamp -- tail -n 1 /mnt/run_container/kata/run_container_output)
    echo "======$i======" >> ~/for_diploma/for_test/run_container/time_result_kata
    echo "$current_time_1 ; $current_time_2; $current_time_3 ">> ~/for_diploma/for_test/run_container/time_result_kata
    kubectl delete -f $namepod.yaml
done
echo "================================================================="
echo "Скрипт отработал!"
echo "================================================================="

