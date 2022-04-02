## test the vinobank app in EKS

instructions to be updated...

### Quickstart

```
#  makesure eksctl and kubectl binaries are in PATH

./setup

# sit back and wait for 15-25 minutes and hopefully no funny errors
# then install the application
kubectl apply -k k8s/envs/dev1

# wait 1-2 minutes then run the test script
# retry a few times if you get hostname cannot resolved error
./t

```

