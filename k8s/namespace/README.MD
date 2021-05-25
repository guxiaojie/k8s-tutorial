
minikube start
kubectl get namespace
kubectl describe namespaces
kubectl create namespace a-namespace
kubectl delete namespaces a-namespace

kubectl apply -f quota-test.yaml
kubectl get quota -n a-namespace

