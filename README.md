## test the vinobank app in EKS

instructions to be updated...

### create and setup ContainerInights in EKS

1. create EKS cluster ``` ./new_cluster ```

2. Attaching a policy to the IAM role of your worker nodes
console -> vm instance -> iam role, attached policy "CloudWatchAgentServerPolicy"

3. Quick Start with the CloudWatch agent and Fluent Bit

ClusterName=vinobank
RegionName=us-west-2
FluentBitHttpPort='2020'
FluentBitReadFromHead='Off'
[[ ${FluentBitReadFromHead} = 'On' ]] && FluentBitReadFromTail='Off'|| FluentBitReadFromTail='On'
[[ -z ${FluentBitHttpPort} ]] && FluentBitHttpServer='Off' || FluentBitHttpServer='On'
curl https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/quickstart/cwagent-fluent-bit-quickstart.yaml | sed 's/{{cluster_name}}/'${ClusterName}'/;s/{{region_name}}/'${RegionName}'/;s/{{http_server_toggle}}/"'${FluentBitHttpServer}'"/;s/{{http_server_port}}/"'${FluentBitHttpPort}'"/;s/{{read_from_head}}/"'${FluentBitReadFromHead}'"/;s/{{read_from_tail}}/"'${FluentBitReadFromTail}'"/' | kubectl apply -f - 


### deploy app
make sure your kubectl current context points to the new EKS cluster

```
cd k8s
kubectl apply -k envs/dev1
```
