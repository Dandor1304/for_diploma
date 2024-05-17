#!/bin/bash
podname=anybench

function create_pod() {
  kubectl apply -f ~/for_diploma/for_test/anybench/runc/Podanybench.yaml
}

function wait_pod_completed() {
  while true ; do
    pod_status=$(kubectl get po $podname | awk '{print $3}' | tail -n 1)

    if [ $pod_status == "Completed" ] || [ $pod_status == "Failed" ]; then
      break
    else
      sleep 180
    fi

  done
}

function delete_pod() { 
  kubectl delete -f ~/for_diploma/for_test/anybench/runc/Podanybench.yaml
}

for i in {1..3}; do
  create_pod
  wait_pod_completed
  delete_pod
done
