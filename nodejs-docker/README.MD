# docker build -t ihealthlabs/sage_mongo:v1.0.1 .
# docker run --name sage_mongo_container1 -p 8080:8080 -d ihealthlabs/sage_mongo:v1.0.1

# k create namespace kubia
# k -n kubia run kubia1 --image=ihealthlabs/sage_mongo:v1.0.1 --port=8080 --generator=run/v1
# k -n kubia expose rc kubia1 --type=LoadBalancer --name kubia-http1
# k -n kubia get service


randome a port
docker run -d -p  8080 --name static_web1 ihealthlabs/sage_mongo:v1.0.1 

assign a port
docker run -d -p 127.0.0.1:80:8080 --name static_web ihealthlabs/sage_mongo:v1.0.1 


-d detached, 

check container
docker ps

CONTAINER ID        IMAGE                           COMMAND                  CREATED             STATUS              PORTS                     NAMES
dfb9757cbac0        ihealthlabs/sage_mongo:v1.0.1   "/bin/sh -c 'node in…"   36 seconds ago      Up 34 seconds       0.0.0.0:32770->8080/tcp   static_web1


*** Volumn
希望同时对代码做开发和测试；
代码改动很频繁，不想在开发过程中重构镜像；
希望在多个容器间共享代码。
 
<!-- docker run -d -p 127.0.0.1:80:8080 \
-v /Users/sagegu/Desktop/EKS-tutorial/myapp:/usr/src/app/  ihealthlabs/sage_mongo:v1.0.3 -->

