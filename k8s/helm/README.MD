# helm

`<link>` : https://github.com/helm/charts/tree/master/stable/wordpress

```
helm repo add bitnami https://charts.bitnami.com/bitnami
helm search repo bitnami
```
```
kubectl create namespace wordpress-release
kubectl -n wordpress-release get all 
helm -n wordpress-release install wordpress bitnami/wordpress
minikube -n wordpress-release service wordpress --url
```
```
helm -n wordpress-release get all wordpress
helm -n wordpress-release uninstall wordpress
kubectl -n wordpress-release get all 
```