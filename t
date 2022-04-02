API_HOST=$(kubectl get ingress fund-transfer -n vinobank --output jsonpath='{.status.loadBalancer.ingress[0].hostname}')

if [ "$API_HOST" = "" ]; then
   echo Cannot get hostname from ingress
   exit 1
fi

curl --insecure -s -L --post301 -H "content-type: application/json" -d @data/transfer_1.json $API_HOST/transfers -v | jq .

# curl -s -L  --post301 -H "content-type: application/json" -d @data/transfer_1.json http://tapi.vino9.net/transfers -v | jq .