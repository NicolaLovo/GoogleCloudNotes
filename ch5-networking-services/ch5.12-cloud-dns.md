# Cloud DNS

DNS as a Service -> acts as an Authoritative DNS server and allows DNS lookups

- global service -> no way to specify certain regions
- 100% availability and low latency

A domain name is required.

Hosts zones through managed name servers:

- public zones -> visible to the internet
  - prerequisite: having a domain name (not provided by Google)
- private zones -> visible only within your network
  - no domain name needed

> [!NOTE]
> A zone is a container for DNS records. It can be public or private.

A private dns zone can be queried from any VPC network in the same project.

> [!NOTE]
> To query private zones from other projects DNS peering is needed. But for DNS peering, VPC peering is NOT required

Each zone is associated to a project

## Demo

Network Services > Cloud DNS

When creating a zone 2 records will be created:

- SOA
- NS
