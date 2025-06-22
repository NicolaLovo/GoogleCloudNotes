# Infrastructure as Code (IaC)

## Terraform

## Config connector

Allows to manage Google Cloud resources (like Pub/Sub topics, Cloud SQL instances, IAM policies, etc.) using Kubernetes-style YAML manifests.

Introduces CRDs like:

- PubSubTopic
- BigQueryDataset
- SQLInstance
- IAMPolicy

Use it when:

- you are already using GKE
- you want a unified way to manage both Kubernetes and Google Cloud resources

Do NOT use it when:

- you are not using GKE
- you are already using terraform

Note that when a resource is managed by Config Connector(e.g. a Pub/Sub topic), it CANNOT be deleted by the gcloud CLI, but only through `kubectl delete` commands.

## Cloud Foundation Toolkit

It is being deprecated in favor of Infra Manager.

## Infra Manager

Deploys and manages the terraform code that manages Google Cloud resources. Provides a managed environment for running Terraform code.

Stores terraform state in Google Cloud Storage.
