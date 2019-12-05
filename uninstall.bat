:: Uninstall coffeeshop-demo and kafka cluster
helm uninstall coffee-v1 -n coffee

:: Remove Keda artifacts (not sure why helm uninstall doesn't clean this up?)
kubectl delete apiservice v1alpha1.keda.k8s.io
kubectl delete crd scaledobjects.keda.k8s.io
kubectl delete crd triggerauthentications.keda.k8s.io

:: Delete coffee namespace
kubectl delete ns coffee

:: Delete Kafka cluster
kubectl delete -f kafka-strimzi.yml -n kafka

:: Uninstall Strimzi Helm chart
helm uninstall strimzi -n strimzi

:: Delete namespaces for Strimzi and Kafka
kubectl delete ns strimzi
kubectl delete ns kafka
