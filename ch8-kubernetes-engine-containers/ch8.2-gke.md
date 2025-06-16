# Google Kubernetes Engine (GKE)

Managed kubernetes offering on Google infrastructure: compute engine instances that form a cluster

- abstracts complexity of hardware
- offers advanced cluster management features:
  - cloud load balancing
  - node pools
  - autoscaling
  - automatic updates
  - node auto-repair
  - logging and monitoring

Cluster architecture:

- 1 or more Control Planes
- 1 or more Nodes

![Cluster architecture](ch8.2-gke.cluster-architecture.png)

## Control Plane

- schedules, manages the whole cluster:
  - handles network, storage
  - makes sure the cluster is in the desired state
- is the unified endpoint of the user

### Control Plane Components

#### API server

Called with `kubectl`, HTTP or gRPC

- detects, responds to cluster events
- all interactions with the cluster are done with api calls

#### Kube scheduler

Discovers and assigns new pods to a node

#### Kube controller manager

Runs control processes

- responds when nodes go down
- maintains the correct number of pods
- creates default accounts and API access tokens
- takes action on the cluster when it does not meet the desired state

#### Cloud controller manager

Embeds cloud-specific logic by linking the cluster to the cloud provider's API

#### ETCD

Stores the state of the cluster:

- key-value store that only interacts with the API server
- stores configurations, what nodes are part of the cluster and what pods are running

## Nodes

- run containerized apps
- responsible for Docker runtime 

### Components

#### kubelet

Agent that communicates with the control plane

- starts, runs docker containers on Pods

#### kube-proxy

Maintains network connectivity between pods and cluster

#### Container runtime

Like `docker` and `containerd`

## GKE abstraction

GKE manages:

- all control plane components
- exposes kubernetes API server -> used by `kubectl`
  - exposes the cluster IP
- automates the kubernetes nodes by launching them as Compute Engine VMs
- automates software updates

### GKE enterprise

> [!NOTE]
> It is part of the Google Anthos platform

Has several benefits over GKE standard:

- enterprise-grade SLA
- shielded GKE nodes and vulnerability scanning
- 24/7 enterprise support
- supports hybrid and multi-cloud deployments, letting enterprises run and manage Kubernetes clusters across on-prem, Google Cloud, and other clouds
- integration with Cloud Operations suite for monitoring, logging...

### GKE Autopilot

Google manages the entire cluster infrastructure. You only manage the workloads.

Benefits:

- no need to provision or maintain nodes
- cost-efficient: pay only for CPU/memory actually requested, not for the entire VM
- automatic scaling, updates, and repairs

But, do not choose autopilot if you need:

- full control over the nodes
- need specific hardware configurations for the nodes
- use node-level DaemonSets

### Configuring GKE to access Artifact Registry

First, give the GKE node service account access to the Artifact Registry repository with the `roles/artifactregistry.reader` role.

Then simply use the required image in the spec, like this:

```yaml
    spec:
      containers:
      - name: my-container
        image: LOCATION-docker.pkg.dev/PROJECT_ID/REPOSITORY/IMAGE:TAG
```