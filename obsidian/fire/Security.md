new solutions for secrets. 
### 1pass
All infra secrets in our infrastructure vault. Argocd somehow has access to this. separate 1pass cred db. maybe provid otp for temp vault access 

### blockchain nodes: 
 - mount secret as file
 - can we make it read only, maybe during init?

review rbac / service account

lock down all SG 0.0.0.0/0

VPN or bastion host.
- how does update happen?

review iam policy

### VPC
- separate db subnets and eks network. 
- possibly seprate runners and auxilary services from eks, in a separate vpc.

### images
- don't run as root?
- no shell access

Will need a way to debug for dev/staging.

