#!/bin/bash
set -x
kubectl apply -f ~/for_diploma/for_test/iperf3/runc/Podserver.yaml
sleep 20
iperf_server_ip=$(kubectl get po -o wide | awk '{print $6}'| tail -n 1)
sed -i -E "s/\b([0-9]{1,3}\.){3}[0-9]{1,3}\b/$iperf_server_ip/g" ~/for_diploma/for_test/iperf3/runc/Podclient.yaml
for i in {1..1000}
do
    kubectl apply -f ~/for_diploma/for_test/iperf3/runc/Podclient.yaml
    sleep 5
    kubectl delete -f ~/for_diploma/for_test/iperf3/runc/Podclient.yaml
done
