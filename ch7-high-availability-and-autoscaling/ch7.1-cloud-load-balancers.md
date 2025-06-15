# Cloud Load Balancers

Load balancer: distributes user traffic across multiple instances

- single point of entry with multiple backends
- fully distributed and software defined -> no hardware involved, all done through software
- Global or Regional load balancer
  - should be as close as possible to users
- autoscaling with health checks

## Backend service

![Backend service](ch7.1-cloud-load-balancers.backend-service.png)

A load balancer knows how to distribute traffic by knowing the **Backend service** that is handling

Backend service configuration:

- traffic distribution:
  - balancing mode -> how the load balancer measures backend readiness
  - target capacity -> max # of connections/rate/CPU utilization
  - capacity scaler -> adjust available capacity without modifying the target capacity
- session affinity
  - requests from the same client will be routed to the same backend (if it has capacity)
- timeouts
  - time the load balancer waits for the service to return a response
- health checks
  - determines if the backend can receive new requests
- backends
  - group of endpoints that receive traffic

### Types of backends

- instance groups
- NEGs(Network Endpoint Groups)

> [!NOTE]
> A backend service can have an instance group OR an NEG: not both

#### NEGs

Configuration object that specifies a group of backend endpoints or services

Use cases:

- container services

## Load balancer categories

![Load balancer categories](ch7.1-cloud-load-balancers.loadBalancer-categories.png)

### Global vs Regional

- Global
  - backends distributed across multiple regions
  - can handle IPv6
- Regional
  - backends in a single region
  - cannot handle IPv6

### Internal vs External

- External
  - distribute traffic from internet to the internal network
  - must have **at least one backend service**
- Internal
  - distribute traffic within the network

### Traffic type

- HTTP(s)
- TCP
- UDP

## Load balancers

5 load balancers available

### HTTP(S) Load balancer

Global, proxy-based, layer 7 load balancer behind a single external IP

- serve the application worldwide
- can be external and internal
- implemented on Google Front End(GFE) infrastructure
- can give support for HTTPS and SSL
  - need SSL certificates (Google Managed or self-managed)
- ports 80, 8080, 443(HTTPS)
- IPv4 and IPv6 traffic
  - IPv6 traffic terminates at the Load balancer and continues as IPv4
- distribute traffic by location or content
- forwarding rules to distribute defined targets to target pools
- *Single Unicast IP* = Single external IP

Traffic management:

- cross-region load balancing
  - available for premium tier *External* type
  - uses a global external IP to route users requests to the backend in the closest region
- content-based load balancing
  - use url maps to select a backend service based on the requested hostname
    - es. /images -> images service; /video -> video service

> [!NOTE]
> This is the only Layer 7 load balancer in GCP, the others are Layer 4 load balancers.

### SSL Proxy

Reverse proxy load balancer that distributes SSL traffic from internet to VMs

Layer 4 load balancer

- client SSL sessions terminated at load balancer and proxied to the closest backend using SSL or TCP
  - premium tier it can be defined as a global load balancer
  - with standard tier it is a regional load balancer
- distributes traffic as location only
- Single Unicast IP
- **support for TCP with SSL offload** (important for exam)
- IPv4 and IPv6 support: same as HTTP load balancer
- can be used for other protocols that use SSL, like Websockets and IMAP over SSL 

### TCP Proxy

Reverse proxy load balancer that distributes TCP traffic from internet to VMs

Layer 4 load balancer

- client SSL sessions terminated at load balancer and proxied to the closest backend using TCP or SSL
- distributes traffic as location only
- Single Unicast IP
- intended for non-HTTP traffic
  - can use SSL for security by providing a certificate
  - supports many TCP ports (es. 25 -> SMTP)
- IPv4 and IPv6 support: same as HTTP load balancer
  - IPv6 traffic terminates at the Load balancer and continues as IPv4

### Network Load Balancer

Pass-through load balancer that distributes TCP and UDP traffic to VMs in the same region

Layer 4 load balancer

- *Direct server return*: it is not a proxy -> responses from the backend go directly to the client, not through the load balancer
- can be regional and external
- supports TCP or UDP, not both
  - no TLS offloading or proxying
  - can support self managed SSL certificates
- supports traffic not supported by TCP proxy and SSL proxy
- SSL decrypted by backends, not by load balancer
- traffic distributed by protocol, scheme and scope
- multiple forwarding rules reference only one target pool

### Internal load balancer

Pass-through load balancer that distributes TCP and UDP traffic to VMs in the same region

Layer 4 load balancer

- accessible only internally
  - balances traffic across instances
- supports TCP or UDP, not both
- traffic automatically sent to the backend
- forwarding rules
  - can specify at least 1 up to 5 ports or `ALL` to forward traffic to all ports
