{
  create(namespace, port): {
    "apiVersion": "v1",
    "kind": "Service",
    "metadata": {
      "name": "cc-service",
      "namespace": namespace
    },
    "spec": {
      "type": "NodePort",
      "selector": {
        "app": "mongodb"
      },
      "ports": [
        {
          "protocol": "TCP",
          "port": 27017,
          "targetPort": 27017,
          "nodePort": port
        }
      ]
    }
  }
}
