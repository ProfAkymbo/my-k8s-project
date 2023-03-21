cd terraform

terraform init

terraform apply --auto-approve

mkdir ~/.kube/

terraform output kubeconfig > config

sed '1d;$d' config| cp /dev/stdin ~/.kube/config

rm config

kubectl apply -f myPortfolio.yaml && kubectl apply complete-demo.yaml

kubectl apply -f carts-service-monitor.yml && kubectl apply -f catalogue-service-monitor.yml && kubectl apply -f front-end-service-monitor.yml && kubectl apply -f orders-service-monitor.yml && kubectl apply -f payment-service-monitor.yml && kubectl apply -f queue-master-service-monitor.yml && kubectl apply -f rabbitmq-service-monitor.yml && kubectl apply -f shipping-service-monitor.yml && kubectl apply -f user-service-monitor.yml

kubectl apply -f front-end-ingress.yml

helm install loki grafana/loki-stack --namespace loki --create-namespace --set grafana.enabled=true --set loki.isDefault=false

kubectl get secret --namespace loki loki-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

kubectl apply -f loki-ingress.yml
