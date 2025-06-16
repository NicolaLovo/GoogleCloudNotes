# GKE Storage Options

Google Cloud offers several storage options

## Google Cloud Managed storage

### Database storage

- Cloud SQL
- Cloud Spanner
- Datastore

### Object storage

- Cloud Storage

### NAS

- Filestore

### Block Storage

- Persistent Disk

## Docker storage

A docker container has a read/write layer where data is stored by default -> makes data ephemeral

3 ways to mount data in a docker container:

- docker volume -> resides in the host filesystem, can be shared among multiple containers
  - is a docker object and is decoupled from the container
- bind mount -> comes directly from the host FS
  - great for local application development
  - cannot be shared among multiple containers
- tmpfs -> stored in memory, great for ephemeral data
  - increases performance, since it does not lie in the container writable layer

## Kubernetes storage

Volumes: basic storage unit

- decouple storage from the container and ties it to the pod
- basically a directory a container can access
  - the Pod spec determines how and where the directory is created

### Persistence

#### Ephemeral storage volumes

Do not persist after the pod ceases to exist

- created with the pod
- persistent across container restarts
- useful for caching temporary information, sharing files between containers

Types:

- emptyDir
- ConfigMap
- Secret

#### Persistent storage volumes

Cluster resource -> durable storage

A `Persistent Volume Claim` can be used to provision a persistent volume

### Volume types

#### emptyDir

- ephemeral
- empty directory that containers can read/write from
- stored on whatever medium is backing the node
  - disk, ssd, networks storage

#### ConfigMap

- provides a way to inject configuration data into Pods
- the data stored can be referenced in a volume of type ConfigMap and then consumed through files

#### Secret

- used to make sensitive data available for apps

#### Downward API

- used to make Downward API data available to applications:
  - info about the Pod and container in which the app is running
  - Pod namespace and IP

#### Persistent Volume Claim(PVC)

Pods use claims as volumes -> the cluster inspects the claim to find the corresponding volume

### Persistent Volumes

Backed by a Persistent Disk or Filestore(NFS)

- its lifecycle is managed by kubernetes -> no need to manually create/delete the backing resources
- exist independently from Pods
- is bound to 1 Persistent Volume Claim

### Persistent Volume Claims

- provision durable storage
- request for a Persistent Volume resource
  - size
  - access mode
  - storage class
- if an existing Persistent Volume can satisfy the request, it is bound to the claim

When deleting a claim, the corresponding PV is deleted

- to prevent it, set the `reclaim policy` to `RETAIN` in the storage class

Deployments are designed to be stateless -> all replicas share the same PV

- in StatefulSets each Pod has its own unique PVC

#### Storage classes

Volume implementations with Cloud resources

- Google cloud creates a `default` storage class with a `pd-standard`
  - used if not specified in a PVC
- can describe custom storage classes

#### Access modes

ReadWriteOnce

- volume can be mounted as read-write by a single node
- default access mode

ReadOnlyMany

- volume can be mounted as read-only by many nodes

ReadWriteMany

- volume can be mounted as read-write by many nodes

#### Type of persistent disks

- Regional persistent disks
  - replicate data between 2 zones
- Zonal persistent disks
  - if a zone is not specified, one is randomly chosen
  - when a pd is provisioned, all Pods referencing that volume are scheduled in the same zone

#### Size

Size of persistent disks determines IOPS and throughput

- use larger and fewer disks if possible
