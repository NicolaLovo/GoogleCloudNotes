# Eventarc

Google Cloud's event routing layer that:

- connects event producers and consumers
- works primarily with Cloud Run, Cloud Functions, and GKE autopilot

For example I can create a cloud run deployment that listens to an eventarc trigger:

```bash
gcloud run deploy storage-listener \
  --image=gcr.io/YOUR_PROJECT/YOUR_IMAGE \
  --allow-unauthenticated

gcloud eventarc triggers create trigger-name \
  --destination-run-service=storage-listener \
  --event-filters="type=google.cloud.storage.object.v1.finalized" \
  --event-filters="bucket=my-bucket-name" \
  --service-account=YOUR_SERVICE_ACCOUNT
```

Considerations:

- the receiving service must be authorize to reinvoke the eventarc trigger --> use IAM roles and service accounts
- Eventarc uses Pub/Sub under the hood
  - permissions on both Eventarc and Pub/Sub must be set correctly
  - Cloud Run must allow invocation from Eventarc's Pub/Sub service account

Common event sources: Pub/Sub, Cloud Storage, Firebase, Audit Logs

## CloudEvents

Vendor-neutral standard format for describing event data across cloud systems. Maintained by the Cloud Native Computing Foundation (CNCF).

Example:

```json
{
  "specversion": "1.0", // version of the CloudEvents specification
  "type": "google.cloud.storage.object.v1.finalized", 
  "source": "//storage.googleapis.com/projects/_/buckets/my-bucket",
  "subject": "objects/my-image.jpg",
  "id": "1234567890",
  "time": "2023-06-16T09:30:00.000Z",
  "datacontenttype": "application/json",
  "data": {
    "bucket": "my-bucket",
    "name": "my-image.jpg",
    "contentType": "image/jpeg"
  }
}
```

Eventarc delivers events in the CloudEvents format. Note that custom sources that use CloudEvents are supported.