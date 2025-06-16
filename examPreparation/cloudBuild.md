# Cloud build

Managed CI/CD platform that can:

- build docker images
- deploy images to GKE, Cloud run...
- integrates with Github and Artifact Registry(push images directly)

Specs:

- serverless

What to build is defined via a `cloudbuild.yaml` file, for example:

```yaml
steps:
  - name: 'gcr.io/cloud-builders/docker'
    args: ['build', '-t', 'gcr.io/$PROJECT_ID/my-app', '.']
  - name: 'gcr.io/cloud-builders/docker'
    args: ['push', 'gcr.io/$PROJECT_ID/my-app']
  - name: 'gcr.io/cloud-builders/gcloud'
    args: ['run', 'deploy', 'my-app', '--image', 'gcr.io/$PROJECT_ID/my-app', '--region', 'us-central1']
```

Use cases:

- build and push docker images
- CI for Cloud Run and GKE --> run tests, build images and deploy
- infrastructure as code --> run terraform scripts when config changes

Alternatives:
- Github Actions
- Gitlab CI/CD
- Jenkins
- Cloud Deploy

**Cloud Build + Artifact Registry + Cloud Run** is the recommended workflow for:

- containerized CI/CD
- serverless applications
- secure and auditable build pipelines

> [!NOTE]
> Cloud Build supports deploying the images, but it is recommended to use **Cloud Deploy** for more complex deployments.

## Cloud Deploy

Used in conjunction with Cloud Build to deploy applications to GKE, Cloud Run.

| Feature                | **Cloud Build**                                    | **Cloud Deploy**                                      |
| ---------------------- | -------------------------------------------------- | ----------------------------------------------------- |
| **Purpose**            | *Build and test software*                          | *Deploy software to environments*                     |
| **Stage**              | Continuous Integration (CI)                        | Continuous Delivery/Deployment (CD)                   |
| **Main Role**          | Compiles code, runs tests, builds container images | Automates delivery of builds to GKE, Cloud Run        |
| **Triggers**           | Code pushes, PRs, manual, scheduled                | From Cloud Build artifact or a release trigger        |
| **Targets**            | Any GCP service or external (via gcloud commands)  | GKE, GKE Autopilot, Cloud Run                         |

Complete workflow:

1. Developer pushes changes to GitHub
2. Cloud Build triggers: test + build + push image to Artifact Registry
3. Cloud Deploy triggers: deploy image to GKE or Cloud Run