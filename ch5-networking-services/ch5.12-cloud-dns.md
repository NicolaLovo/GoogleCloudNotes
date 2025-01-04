# Cloud DNS

DNS as a Service -> acts as an Authoritative DNS server and allows DNS lookups

- global service -> no way to specific certain regions
- 100% availability and low latency

Hosts zones through managed name servers:

- public zones -> visible to the internet
  - prerequisite: having a domain name (not provided by Google)
- private zones -> visible only within your network
  - no domain name needed

> [!NOTE]
> To query private zones from other projects DNS peering is needed. VPC peering is NOT required for DNS peering

Each zone is associated to a project

## Demo

Network Services > Cloud DNS

When creating a zone 2 records will be created:

- SOA
- NS