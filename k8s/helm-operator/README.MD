
https://github.com/bitnami/charts

``` helm search repo bitnami | grep bitnami/kube-prometheus ```

k create namespace prometheus
helm -n prometheus install my-prometheus bitnami/kube-prometheus