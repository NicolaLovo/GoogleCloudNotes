# Metadata and startup scripts

## Querying metadata

### Query instance metadata

> [!IMPORTANT]
> Metadata can be queried **only** from **inside** the VM. Not from outside(e.g. the gcloud sdk on my pc)

- ssh into machine
- `curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/` -> query instance metadata
  - the trailing `/` means that the instance segment is an directory
  - need to provide the header `"Metadata-Flavor: Google"`: otherwise the request will be rejected

Returns a list of metadata:

```
attributes/
cpu-platform
description
disks/
gce-workload-certificates/
guest-attributes/
hostname
id
image
licenses/
machine-type
maintenance-event
name
network-interfaces/
partner-attributes/
preempted
remaining-cpu-time
scheduling/
service-accounts/
shutdown-details/
tags
virtual-clock/
zone
```

A trailing `/` means the resource is a folder

- to query a resource append the path to the request, for example:
  - `curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/zone`

### Query project metadata

- ssh into machine
- `curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/project/` 

### Custom metadata

Can be queried from the `attributes/` folder in both instance and project metadata

Example: `curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/project/attributes/myMetadataKey`

## Scripts

Can create custom startup and shutdown scripts

### Startup script

Use cases:

- update, install software

2 ways to enable:

- add a machine metadata with key `startup-script` and value a script
- add a script in the dedicated section

Example script:

```sh
#!/bin/bash

NAME=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/name)

echo $NAME > name.txt
```

#### Store startup script in storage

- Create a bucket 
- upload script file
- copy file URI (like `gs://ws-script/script.sh`)
- Create a metadata `startup-script-url`: `${fileURI}`

> [!NOTE]
> The VM must be able to access the bucket

### Shutdown script

Use cases:

- cleanup