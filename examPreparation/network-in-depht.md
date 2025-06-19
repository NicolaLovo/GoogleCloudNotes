# Networking in Depth

## Cloud CDN (Content Delivery Network)

It requires an external HTTP(S) load balancer to work.

Use cases:

- faster content delivery --> caches content at edge locations
- reduce costs and load on the backend --> cuts egress fees and reduces the requests that hit the server
- integrated security --> integrates with Cloud Armor for DDoS protection
  - supports signed URLs and cookies to restrict access to content
- can invalidate cache manually or automatically

Example:

- global e-commerce
- video streaming

> [!NOTE]
> Architecture:
> Client --> Google Edge (Cloud CDN) --> Global Load Balancer --> Backend (GCE, GKE, etc.)

## Cloud NAT

Allows VMs without external IP addresses to access the internet securely, without being directly exposed to it.

- automatically scales
- highly available

> [!NOTE]
> Applies ony to egress traffic, not ingress.

Use cases:

- VM that need to access to external services, but want to remain private (e.g. linux VM that needs to install packages)
- Essential in private GKE clusters --> GKE cluster pulls container images from DockerHub
- Internal microservices call third-party APIs (e.g. firebase, stripe...)

Architecture:
```
+----------------------------+
|    Private VM (no ext IP) |
+------------+--------------+
             |
             |   VPC Route to Cloud NAT
             |
+------------v-------------+       +-------------------+
|       Cloud NAT          +------->      Internet     |
+--------------------------+       +-------------------+
```