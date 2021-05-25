
- rbac
- 
https://medium.com/@HoussemDellai/rbac-with-kubernetes-in-minikube-4deed658ea7b

```
mkdir cert && cd cert

openssl genrsa -out user1.key 2048

openssl req -new -key user1.key -out user1.csr -subj '/CN=user1/O=group1'

openssl x509 -req -in user1.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out user1.crt -days 500


minikube start
 
kubectl config set-credentials user1 --client-certificate=user1.crt --client-key=user1.key

```

```
minikube start --extra-config=apiserver.authorization-mode=RBAC

kubectl create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default

minikube dashboard
```