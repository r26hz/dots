eeCoreDNS config
```
.:53 {
    errors
    health {
        lameduck 5s
      }
    ready
    kubernetes cluster.local in-addr.arpa ip6.arpa {
      pods insecure
      fallthrough in-addr.arpa ip6.arpa
    }
    prometheus :9153
    forward . /etc/resolv.conf
    cache 30
    loop
    reload
    loadbalance
}
```

/etc/resolv.conf in pod
```
search django.svc.cluster.local svc.cluster.local cluster.local us-west-2.compute.internal
nameserver 172.20.0.10
options ndots:5

```



Maybe we want to use headless services?
set DNS policy for the pod. Defaults to "ClusterFirst". Valid values are 'ClusterFirstWithHostNet', 'ClusterFirst', 'Default' or 'None'. DNS parameters given in DNSConfig will be merged with the policy selected with DNSPolicy. To have DNS options set along with hostNetwork, you have to specify DNS policy explicitly to 'ClusterFirstWithHostNet'. Note that 'None' policy is an alpha feature introduced in v1.9 and CustomPodDNS feature gate must be enabled to use it.\

staging eth ndot set to 1 at 14:21 
eth cache 2048 at 14:45

ndot1 

I think i know what's happening. MM Triggers an 

We need to:
- set ndot on eth
- set resource limits
- 

Set limits. https://learnk8s.io/allocatable-resources

EKS nodes memory reserver
Reserved memory = 255MiB + 11MiB * MAX_POD_PER_INSTANCE (based on instance type)

For CPU resources, EKS follows the GKE implementation and reserves:

    6% of the first core
    1% of the following core (up to 2 cores)
    0.5% of the following 2 cores (up to 4 cores)
    0.25% of any cores above 4 cores

It's interesting to note that the memory allocatable to Pods is 90% when prefix delegation is disabled and drops to 80.5% when enabled.


t3.large 35

We should consider r5.2Xlarge ($500/month)
`