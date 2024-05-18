#!/bin/bash
set -x
kubectl apply -f ~/for_diploma/for_test/iperf3/kata/Podserver.yaml
sleep 80
iperf_server_ip=$(kubectl get po iperf-server -o wide | awk '{print $6}'| tail -n 1)
sed -i -E "s/\b([0-9]{1,3}\.){3}[0-9]{1,3}\b/$iperf_server_ip/g" ~/for_diploma/for_test/iperf3/kata/Podclient.yaml
for i in {1..1000}
do
    kubectl apply -f ~/for_diploma/for_test/iperf3/kata/Podclient.yaml
    sleep 25
    kubectl delete -f ~/for_diploma/for_test/iperf3/kata/Podclient.yaml
done
