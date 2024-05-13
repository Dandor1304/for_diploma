#!/bin/bash
namepod="PodHostpath"
for i in {1..10}; do
    current_time_1=$(date +%s.%N)
    kubectl apply -f $namepod.yaml
    current_time_2=$(date +%s.%N)
    sleep 5
    current_time_3=$(kubectl exec timestamp -- tail -n 1 /mnt/run_container/run_container_output)
    echo "======$i======" >> /home/cloudadmin/for_diploma/for_test/run_container/results/time_result
    echo "$current_time_1 ; $current_time_2; $current_time_3 ">> /home/cloudadmin/for_diploma/for_test/run_container/results/time_result
    kubectl delete -f $namepod.yaml
done
echo "================================================================="
echo "Скрипт отработал!"
echo "================================================================="

