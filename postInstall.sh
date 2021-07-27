keptn install -y --use-case=continuous-delivery

wget https://raw.githubusercontent.com/keptn-sandbox/monaco-service/0.8.4/deploy/service.yaml
kubectl apply  -n keptn -f service.yaml
