# Networking services

## Virtual Private Cloud (VPC)

Virtualized network withing GC 
Core networking service, global resource that spans through all the regions
Each VPC contains a default network

- can create additional networks in a project, but a network **cannot be shared** between projects

## Firewall Rules

Governs traffic coming on a network
Each default network has a default Firewall with its rules

- can customize these rules

## Routes

Specifies how traffic is routed within the VPC: how packets should be redirected

## Load balancing

Distribute workloads across multiple instances

### HTTP(S) Load Balancing

Distribute traffic across regions to ensure that requests are routed to the closest healthy region (even in case of failure)
Distribute traffic based on content type

### Network Load Balancing

Distribute traffic among servers in the same region, based on the incoming IP protocol data

## GC DNS

Publish and maintain DNS records with the CLI, API and SDK

## Cloud VPN

Connect your network to your VPC network through an IPsec connection, traversing the public internet

## Direct Interconnect

Connect your network to your VPC using an highly-available, low-latency connection 
Does NOT traverse the public internet

## Direct/Carrier Peering

Traffic flow through Google edge location
