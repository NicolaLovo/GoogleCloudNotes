# IAM best practices

Principle of least privilege

Be cautious when granting the owner role

Resource hierarchy:

- mirror Google Cloud resource hierarchy to structure the organization
- set policies at organization/project level rather than at resource level

## Service accounts

- treat each app as a separate trust boundary -> different service account for each app
- audit service accounts and keys
- grant the minimum set of permission
- rotate user managed keys
  - name keys to reflect use and permissions
- don't check in service account keys into source code

## Auditing

- check logs regularly 
- check who can edit logging and AIM policies
  - restrict log access
- export logs to cloud storage to store them for long term
- audit service account key access

## Policy management

- grant roles to a Google group instead of a user where possible
  - when creating multiple roles to a particular task create a Google group instead of a single user
