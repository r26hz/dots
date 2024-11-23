Tags: [[Kubernetes]]
## Manage kubeconfigs
`export KUBECONFIG=~/.kube/config:/path/cluster1:/path/cluster2
`kubectl config view --flatten > all-in-one-kubeconfig.yaml

## argocd port forward
kubectl port-forward svc/firedex-argo-argocd-server -n argocd 8080:443