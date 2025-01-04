# Network Address Translation (NAT)

Translates local private IPs to public IPs before transferring packets

- designed to deal with the scarcity of free IPv4 addresses
  - now IPv6 networks do not need NAT since there is no shortage
- provides security and privacy

Types of NAT:

- Static NAT: mapping from 1 private IP to 1 public IP
- Dynamic NAT: 1 private IP to 1 public IP in a pool of public addresses
  - used when multiple internal hosts share few public IPs -> the public IPs are assigned dynamically
  - if there are no public IPs available, connection from private IPs is refused until a public IP is available
- Port Address Translation (PAT) or NAT overload: multiple private IPs to 1 public IP (many-to-one architecture)
  - used in home routers
  - used in Google Cloud NAT

## Port Address Translation

Every TCP connection has a source and destination port: as long as the source port is different, many clients can use the same public IP.

The NAT stores an association between (privateIP, privatePort, publicIP, publicPort):

- when a client performs a request, the NAT allocates a random port in the public IP, adjusts the packet and forwards it
- when the response is received, the NAT performs the inverse

