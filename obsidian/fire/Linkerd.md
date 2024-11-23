https://docs.buoyant.io/buoyant-enterprise-linkerd/latest/installation/
# setup
`export BUOYANT_LICENSE=''`
`curl --proto '=https' --tlsv1.2 -sSfL https://enterprise.buoyant.io/install | sh`

```
Buoyant Enterprise for Linkerd enterprise-2.16.0 was successfully installed. 🎉

Add the CLI to your path with:

  export PATH=/home/ricky/.linkerd2/bin:$PATH

❯ linkerd version --client
Client version: enterprise-2.16.0

```
## uninstall

linkerd viz uninstall | kubectl delete -f - 
kubectl get deploy -o yaml | linkerd uninject - | kubectl apply -f -

```
Adding the annotation to existing pods does not automatically mesh them. For existing pods, after adding the annotation you will also need to recreate or update the resource (e.g. by using kubectl rollout restart to perform a rolling update) to trigger proxy injection.
```


### Linkerd-Viz
visual tool for staging. Should not run in prod


Linkerd-webhook config for CAinject?
```
set {
    name = "tap.injectCaFrom"
    value = "<namespace>/ <linkerd-tap-cert-name>"
  }
```

set 127.0.0.1 localhost in /etc/hosts
### latency
    LATENCY_P50 is the minimum latency in which 50% of requests complete
    LATENCY_P95 is the minimum latency in which 95% of requests complete
    LATENCY_P99 is the minimum latency in which 99% of requests complete

The P50 latency provides a good sense of the average latency for a given workload or set of workloads; the P95 and P99 latencies provide a good sense of how outliers behave. In a perfect world, all three will be low and close together.

    If the P50 latency rises, but P95 and P99 are close to P50, this tends to indicate that the workload as a whole is slowing down. It may be taking too much traffic, or it may be starved more CPU. Alternately, perhaps the incoming requests have become more complex.

    If the P50 latency stays the same, but P95 and P99 start rising, this tends to indicate a need to focus on outliers: perhaps a particular code path has gotten slower or is failing, or perhaps another microservice that isn't used for every request is having issues.

In all cases, keeping an eye on latency over time is critical: you need to have a sense of what's typical for a given workload over time.



### Authorization Policy
https://linkerd.io/2-edge/features/server-policy/

By default Linkerd allows all traffic to transit the mesh

Linkerd’s policy is configured using two mechanisms:

    A set of default policies, which can be set at the cluster, namespace, workload, and pod level through Kubernetes annotations.
    A set of CRDs that specify fine-grained policy for specific ports, routes, workloads, etc.


#### Non-k8s workload and external-workload
https://www.youtube.com/results?search_query=linkerd+external+services
https://linkerd.io/2-edge/tasks/adding-non-kubernetes-workloads/
https://linkerd.io/2-edge/reference/external-workload/


```SHELL=/usr/bin/bash
WINDOWID=8388622
COLORTERM=truecolor
XDG_SESSION_PATH=/org/freedesktop/DisplayManager/Session3
TERM_PROGRAM_VERSION=3.4
TMUX=/tmp/tmux-1000/default,943,3
I3SOCK=/run/user/1000/i3/ipc-socket.847
AWS_PROFILE=firedex-staging
TMUX_PLUGIN_MANAGER_PATH=/home/ricky/.tmux/plugins/
DESKTOP_SESSION=i3
KITTY_PID=869
EDITOR=nvim
GTK_MODULES=canberra-gtk-module
XDG_SEAT=seat0
PWD=/home/ricky/fd/fireex/linkerd/helm
XDG_SESSION_DESKTOP=i3
LOGNAME=ricky
XDG_SESSION_TYPE=x11
XAUTHORITY=/tmp/xauth_QsdEQZ
KITTY_PUBLIC_KEY=1:<qji$I8*asa}=o}v5yN@(WakV!T~lbS2ZLP+3~SO
MOTD_SHOWN=pam
HOME=/home/ricky
LANG=en_US.UTF-8
XDG_CURRENT_DESKTOP=i3
STARSHIP_SHELL=bash
KITTY_WINDOW_ID=1
XDG_SEAT_PATH=/org/freedesktop/DisplayManager/Seat0
STARSHIP_SESSION_KEY=4303307122504912
XDG_SESSION_CLASS=user
TERMINFO=/usr/lib/kitty/terminfo
TERM=screen-256color
USER=ricky
TMUX_PANE=%59
DISPLAY=:0
SHLVL=1
XDG_VTNR=2
XDG_SESSION_ID=2
KUBECONFIG=/home/ricky/.kube/firedex-staging-kubeconfig.yml
XDG_RUNTIME_DIR=/run/user/1000
VIRTUAL=nvim
DEBUGINFOD_URLS=https://debuginfod.archlinux.org
GTK3_MODULES=xapp-gtk3-module
XDG_DATA_DIRS=/home/ricky/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share
PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/var/lib/flatpak/exports/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/ricky/.local/bin:~/go/bin/:/usr/lib/ccache/bin:~/.cargo/bin:/home/ricky/.local/bin:/home/ricky/.linkerd2/bin:/home/ricky/.local/bin
DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
MAIL=/var/spool/mail/ricky
KITTY_INSTALLATION_DIR=/usr/lib/kitty
TERM_PROGRAM=tmux
_=/usr/bin/env


```
### Ingress
https://linkerd.io/2.16/tasks/using-ingress/

```
  annotations:
    nginx.ingress.kubernetes.io/service-upstream: "true"
```
### Questions
any overlap for services provided by datadog?

error:
```control-plane-version

can retrieve the control plane version

control plane is up-to-date

unsupported version channel: enterprise-2.16.2

seehttps://linkerd.io/2/checks/#l5d-version-controlfor hints


```


## Prod setup thoughts and concerns
- Cert management? 
- helm install, save config
- Resource consumption math (lots of overhead with injectors)
- port conflict? 8080