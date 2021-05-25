echo -n 'username' |  base64
dXNlcm5hbWU=
echo -n 'password' |  base64
cGFzc3dvcmQ=

kubectl -n sage apply -f k8s/secret.yaml 
secret/mongodb-secret created

k -n sage get secret

NAMESPACE=sage
VERSION=latest
PORT=30000
jsonnet --tla-str namespace=$NAMESPACE \
  --tla-str version=$VERSION \
  --tla-code port=$PORT \
  -m build topology.jsonnet


  kubectl -n sage apply -f build/cc-deployment.json 

  k -n sage get all
NAME                                     READY   STATUS             RESTARTS   AGE
pod/mongodb-deployment-777775c8f-nms4b   0/1     ImagePullBackOff   0          22s

NAME                                 READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/mongodb-deployment   0/1     1            0           23s

NAME                                           DESIRED   CURRENT   READY   AGE
replicaset.apps/mongodb-deployment-777775c8f   1         1         0       24s

kubectl -n sage apply -f build/cc-svc.json  
kubectl -n sage get svc

----------
k -n sage get all
step 1
mongo deployment
k -n sage apply -f mongo-secret.yaml 
k -n sage get secret
 
k -n sage apply -f mongodb-deployment.json 
k -n sage get pod --watch


step 2
apply service
k -n sage apply -f mongodb-service.json 
k -n sage describe service mongodb-service 

k -n sage get pod -o wide

step 3
mongo express deployment service configmap

k -n sage apply -f configmap.yaml 
k -n sage apply -f deployment.json 
k -n sage apply -f service.json 

others
mongo --username dXNlcm5hbWU= --password --authenticationDatabase admin  


----
k -n sage apply -f k8s/mongo/mongo-secret.yaml 
k -n sage apply -f k8s/mongo/mongodb-deployment.json 
k -n sage apply -f k8s/mongo/mongodb-service.json 


 k -n sage apply -f k8s/mongo-express/deployment.json 
 k -n sage apply -f k8s/mongo-express/service.json 

这里有脚本
 https://github.com/rohnux/Deployment-of-Mongodb-and-Mongo-Express-UI-on-Kubernetes
 某人写的教程
 https://www.bogotobogo.com/DevOps/Docker/Docker_Kubernetes_MongoDB_MongoExpress.php