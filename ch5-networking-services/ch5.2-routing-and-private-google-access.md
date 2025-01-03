# Routing and private google access

## Routing

Defines the network traffic path from one destination to another, all routes are stored in the routing table for the VPC.

> [!NOTE]
> Routing table: stored in a router, stores routes to particular destinations
> In GC it is stored in the VPC

In a VPC it consists of a single destination(CIDR) and a single next hop. 

When a VM in a VPC sends a packet, Google delivers the packet to the next hop of an applicable route based on a routing order

Routing types:
1. System-generated -> generated for each new network(Auto mode or Custom mode)
   1. Default route -> defines the path to internet and a path for private google access
      1. Can be deleted **only by replacing with a custom route**
   2. 1 Subnet route for each subnet
2. Custom routes
   1. Static routes
   2. Dynamic routes