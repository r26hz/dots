We should be setting resource limits. This guarantees the resource for the container. Instead of setting a limit on our hungry blockchain nodes, we should instead be setting minimums for all our apps and services. If an app gets booted OOM, we should increase it's resource request.

## Nginx-fd

  # nginx prod usage June 2024
  # cpu Avg:5m Max:10m
  # mem Avg:6Mi Max:13Mi


## bitcoind

prod
cpu - Avg:33.7 Max:723
mem - Avg:6