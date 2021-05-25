#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
NAMESPACE=$NAMESPACE
CC_VERSION=$1
CC_MYSQL_HOST=$MYSQL_HOST
CC_MYSQL_PASSWORD=$MYSQL_PASSWORD
CC_PORT=31744

#Create secret in namespace if needed
if [[ $(kubectl -n $NAMESPACE get secret ihealth-docker-repo -o json --ignore-not-found) ]]; then
  echo "Found the secret for docker repo, no need to create it again"
else
  if [[ -z $IHEALTH_DOCKER_USERNAME ]]; then
    read -p "Input docker repo username: " IHEALTH_DOCKER_USERNAME
  fi

  if [[ -z $IHEALTH_DOCKER_PASSWORD ]]; then
    read -sp "Input docker repo password: " IHEALTH_DOCKER_PASSWORD
  fi
  echo ""
  echo $IHEALTH_DOCKER_USERNAME $IHEALTH_DOCKER_PASSWORD
  kubectl -n $NAMESPACE create secret docker-registry ihealth-docker-repo --docker-server="https://index.docker.io/v1/" --docker-username=$IHEALTH_DOCKER_USERNAME --docker-password=$IHEALTH_DOCKER_PASSWORD
fi

mkdir -p $BASEDIR/build
rm -rf $BASEDIR/build/*

jsonnet --tla-str namespace=$NAMESPACE \
  --tla-str version=$CC_VERSION \
  --tla-str mysql_host=$CC_MYSQL_HOST \
  --tla-str mysql_password=$CC_MYSQL_PASSWORD \
  --tla-code port=$CC_PORT \
  -m $BASEDIR/build $BASEDIR/topology.jsonnet

(
  echo "cat <<EOF"
  cat $BASEDIR/build/cc-deployment.json
  echo EOF
) | sh >$BASEDIR/build/cc-deployment-replaced.json
rm -f $BASEDIR/build/cc-deployment.json

# kubectl -n $NAMESPACE apply -f $BASEDIR/build/
