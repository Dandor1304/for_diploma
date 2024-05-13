#!/bin/bash
set -x
kubectl apply -f /home/cloudadmin/for_diploma/for_test/iperf3/Podserver.yaml
sleep 2
iperf_server_ip=$(kubectl get po -o wide | awk '{print $6}'| tail -n 1)
sed -i -E 's/\b([0-9]{1,3}\.){3}[0-9]{1,3}\b/$iperf_server_ip/g'/home/cloudadmin/for_diploma/for_test/iperf3/Podclient.yaml
for i in {1..10}
do
    kubectl apply -f /home/cloudadmin/for_diploma/for_test/iperf3/Podclient.yaml
    sleep 5
    kubectl delete -f /home/cloudadmin/for_diploma/for_test/iperf3/Podclient.yaml
done
