
local ccDeploy = import "cc-deployment.jsonnet";
local ccSvc = import "cc-svc.jsonnet";

function(
    namespace = "backend",
    version = "latest",
    port) {
  "cc-deployment.json": ccDeploy.create(namespace, version),
  "cc-svc.json": ccSvc.create(namespace, port)
}
