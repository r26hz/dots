Tags: [[Kubernetes]]
## Manage kubeconfigs
`export KUBECONFIG=~/.kube/config:/path/cluster1:/path/cluster2
`kubectl config view --flatten > all-in-one-kubeconfig.yaml