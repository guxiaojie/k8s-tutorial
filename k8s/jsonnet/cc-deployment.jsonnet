{
  create(namespace, version): {
  "apiVersion": "apps/v1",
  "kind": "Deployment",
  "metadata": {
    "name": "mongodb-deployment",
    "namespace": namespace,
    "labels": {
      "app": "mongodb"
    }
  },
  "spec": {
    "replicas": 1,
    "selector": {
      "matchLabels": {
        "app": "mongodb"
      }
    },
    "template": {
      "metadata": {
        "labels": {
          "app": "mongodb"
        }
      },
      "spec": {
        "containers": [
          {
            "name": "mongodb",
            "image": "mongo:"+version,
            "ports": [
              {
                "containerPort": 27017,
              },
            ],
            "imagePullPolicy": "Always",
            "securityContext": {
              "runAsUser": 0
            },
            "env": [
              {
                "name": "MONGO_INITDB_ROOT_USERNAME",
                "valueFrom": {
                  "secretKeyRef":{
                    "name": "mongodb-secret",
                    "key": "mongo-root-username"
                  },
                }
              },
              {
               "name": "MONGO_INITDB_ROOT_PASSWORD",
               "valueFrom": {
                  "secretKeyRef":{
                    "name": "mongodb-secret",
                    "key": "mongo-root-password"
                  },
                }
              }
            ],
            "resources": {
              "limits": {
                "cpu": "0.2",
                "memory": "0.2Gi"
              },
              "requests": {
                "cpu": "0.2",
                "memory": "0.2Gi"
              }
            }
          }
        ]
      }
    }
  }
}
}
