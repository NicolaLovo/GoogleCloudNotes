# IAM best practices

Principle of least privilege

- prefer predefined roles over primitive roles
- child resources cannot restrict permissions granted to parent resources
- restrict who can manage IAM policies
- be cautious when granting the owner role

Resource hierarchy:

- mirror Google Cloud resource hierarchy to structure the organization
- group resources into projects that share the same trust boundaries
- grant roles at folder level instead of at project level, if spanning across multiple projects

## Service accounts

- treat each app as a separate trust boundary -> different service account for each app
- don't delete service accounts that are used by resources
- audit service accounts and keys
- grant the minimum set of permission
- rotate user managed keys
  - name keys to reflect use and permissions
- restrict who can access service accounts
- don't check in service account keys into source code

## Auditing

- check logs regularly and audit every IAM policy change
- check who can edit logging and AIM policies
  - restrict log access
- export logs to cloud storage to store them for long term
- audit service account key access

## Policy management

- to grant access to all projects in an organization, use an organzation policy
- grant roles to a Google group instead of a user where possible
  - when creating multiple roles to a particular task create a Google group instead of a single user
