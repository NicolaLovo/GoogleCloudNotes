# Connecting to instances

## Set password of Windows instance

RDP button > Set Windows password

## Configure OS Login for Linux

Edit machine > Custom metadata(instance metadata):

- `enable-oslogin`: `TRUE`

To enable OS Login project-wide place the same metadata in project metadata

SSH keys are managed in the same screen as project metadata

Connect with os-login:

- `gcloud compute os-login ssh-keys add --key-file ${pathToPublicKey}` -> store key with my user google account
  - returns a username that must be used in the next command
- `ssh -i ${privateKeyFile} ${googleCloudUserName}@${instanceIPAddress}`

> [!IMPORTANT]
> Need role `Compute OS Login` to perform OS Login as a normal user 
> 
> `Compute OS Admin Login` to give root OS Login


### Option: Block project-wide SSH keys

*Project-wide public SSH keys* allow users access to all linux instances in a project that allow *Project-wide public SSH keys*

- can be disabled on an instance by ticking the checkbox *Block project-wide SSH keys*
  - can allow only certain users by adding the SSH key to the instance metadata

