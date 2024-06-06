# Google Cloud infrastructure

Redundant cloud regions connected by high-speed fiber cables

- 24 regions
- 73 zones
- 144 network edge zones
- 200 countries

## Request routing

Request to Google Database flow:

- request forwarded to Google POP (Point of Presence -> edge network) 
- the POP forwards request to Google Data Center
- POP forwards request to user


## Geography and Regions

### Zone

Smallest entity in GC network: Deployment area for GC resources within a Region
es. us-east4-a

- a "single failure domain" within a region
- deploy closer to user

### Region

Independent geographic area divided in zones
Designed for fault tolerance and high availability
Latency <5ms

### Multi-Region

Large areas that contain 2 or more regions -> maximize redundancy and distribution to ensure high-availability