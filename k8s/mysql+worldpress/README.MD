
 k -n wordpress apply -f ./ # create resource(s) in all manifest files in dir
minikube -n wordpress service wordpress --url


 k -n wordpress delete all --all
 k -n wordpress get pvc 
 k -n wordpress delete pvc --all