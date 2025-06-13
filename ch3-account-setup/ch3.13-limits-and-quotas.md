# Limits and quotas

Hard limit on how much of a Google Cloud resource your project can use.

- API rate quota -> rate limit for api requests per day
- Allocation Quota -> es. # of VMs per project. Does not reset over time, must be explicitly released.
  - can be increased by requesting it

Reasons for quotas:

- protect other gcloud users preventing excessive usage
- allow resource management

## Cloud monitoring

Provide metrics to create dashboards, metrics and alerts.

Not monitored services:

- app engine
- cloud storage
- cloud sql

> [!NOTE]
> Quotas are updated once a day, so it may take up to 24 hours for changes to take effect.

## Viewing quotas

- quota page: IAM&Admin > Quotas
- API dashboard: APIs&Services
- apis
