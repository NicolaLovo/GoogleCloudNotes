# Cloud SDK and CLI

Set of command line tools to manage resources through the terminal. Examples:

- gcloud
- gsutil
- bq
- kubectl

Authorize cloud SDK tools. 2 options:

- use a User account -> associated to a user, often used on a single machine
- service account -> associated to a project and not a specific user, often used on multiple machines

## Built-in commands

`gcloud init` -> Initialize, setup, authorize

`gcloud auth login` -> Authorize access to gcloud

`gcloud config` -> Config accounts and projects

`gcloud components` -> Install, update, delete sdk components

Command format:

`gcloud ${component} ${entity} ${operation} ${positional arguments} ${--flags}`

Example:
`gcloud compute instances create example-instance-1 --zone=us-central-1-a`

`gcloud config list`
