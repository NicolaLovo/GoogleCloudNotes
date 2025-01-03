# Service accounts

def: account used by an application/VM and not a person. Represents a non-human user that wants to authenticate and use gcp apis. They are both an identity and a resource(since it can be managed by users).

It is identified by a unique email address: `${name}@${projectId}.iam.gserviceaccount.com`

3 types of service accounts:

1. User-managed -> user created the account choosing the name/email. Can create up to 100 user-managed service account (can increase quota if needed)
   1. `${name}@${projectId}.iam.gserviceaccount.com`
2. default -> some gcp services create service accounts
   1. `${projectId}@appspot.gserviceaccount.com` -> created by app engine
   2. `${projectNumber}-compute@developer.gserviceaccount.com` -> created by compute engine
3. google-managed -> created and managed by Google, used by Google service, some are visible some hidden. Do NOT change/revoke their roles
   1. name ends with "Service Agent" or "Service Account"
   2. E.g. google api service agent: `${projectNumber}@cloudservices.gserviceaccount.com`

## Service account keys

These accounts authenticate using a public/private RSA key pair:

- Google managed keys -> Google stores, rotates... the keys
  - stored in Google Cloud Key Management System (KMS)
- User managed -> user owns both private and public keys. Google only stores the public key
  - user responsible for all key management

## Service account permissions

A service account is also a resource and have IAM policies for viewing/editing them.

- can grant access for the specific service account or all service accounts in the project

> [!IMPORTANT]
> A user that has access to the service account, can indirectly access all resources that the service account can access: *Service account impersonation*

### Service account access scopes

Legacy method to specify permissions for resources, used in substitution of IAM. It is the default for **Default service accounts**.

For custom accounts we can use instead IAM.

## Use of service accounts

1. attach service account to resource
2. impersonate a service account


