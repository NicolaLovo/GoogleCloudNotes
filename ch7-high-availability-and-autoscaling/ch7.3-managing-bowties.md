# Demo

To allow HTTP/HTTPS traffic, create the corresponding firewall rules or tick the checkboxes:

- Allow HTTP traffic
- Allow HTTPS traffic

## Health checks Firewall rule

[Guide](https://cloud.google.com/load-balancing/docs/health-check-concepts#ip-ranges)

Targets: All instances in the network

Source IP ranges: `35.191.0.0/16`, `130.211.0.0/22`

## Scale-in

There is a 10 minutes stabilization period needed before scaling down built into google cloud that cannot be changed.

Workaround(should never be done in production):

- Restart/Replace VMs