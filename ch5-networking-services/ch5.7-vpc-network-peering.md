# VPC Network peering

Also called "VPC Peering" --> communicate privately between VPCs

By default, communicating between VPCs we should route through the public internet. The objective is to allow private connectivity across 2 VPC networks (following the RFC 1918 standard)

- traffic stays in Google network
- peer across VPCs in same or different _projects/organizations_
- reduces network latency -> stay in Google's network
- increased network security
- reduce network costs -> only traffic with public IPs is billed, with this only internal IPs are used

Notes:

- each VPC remains administratively independent
  - different firewall rules, routes...
- peering becomes active when proper configuration from each side is done
- during peering the VPCs exchange all subnet routes,
  - custom routes can be exchanged if requested

Restrictions:

- CIDR ranges cannot overlap between directly peered VPCs
- no overlapping subnet ranges between directly peered VPCs
- cannot directly filter which subnets of peered VPC are reachable: those have to be configured with firewall rules
  - by default ingress traffic in VMs is blocked by the _implied deny ingress rule_
- no transitive peering is allowed
- internal DNS is not accessible for compute engine in peered VPCs since it needs an IP to communicate

![Peering schema](ch5.7-vpc-network-peering.peering.png)

Use cases:

- 2 companies that want to share resources

## Demo

![Demo schema](ch5.7-vpc-network-peering.demo.png)

VPC Network > VPC Network peering

- create a peering connection in BOTH VPCs bowtieinc-a and bowtieinc-b: if you create only one, the peering will not work
