API_HOST=$(kubectl get service fund-transfer -n vinobank --output jsonpath='{.status.loadBalancer.ingress[0].hostname}')

if [ "$API_HOST" = "" ]; then
   echo Cannot get hostname from ingress
   exit 1
fi

echo $API_HOST
curl -s -H "content-type: application/json" -d @data/transfer_1.json http://${API_HOST}:8080/transfers -v | jq .
