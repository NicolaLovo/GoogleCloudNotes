# Cloud Identity

## Directory service

Maps names of network resources to their network addresses. It provides a way to manage users, computers, and other resources in a network.

E.g:

- DNS
- Microsoft Active Directory --> industry standard
  - Azure Active Directory
- Apache Directory Server
- OpenLDAP
- Cloud Identity

## Cloud Identity IDaaS

Identity as a Service(IDaaS)

Federates Google Cloud, Active Directory, and other identity providers.

Capabilities:

- manage access and compliance across all users
- use IAM to manage user access to google cloud resources

2 versions: premium and free

### Free

Device management capabilities:

- basic mobile device management
- device inventory
- remote account wipe

Directory:

- basic directory management
- organizational units and groups
- google cloud directory sync
- google Admin app for IOS/Android

SSO:

- Google SSO
- setup SSO using a third party IdP 

Security:

- user security management
- self-service password reset
- 2 step verification

Reporting:

- basic reporting
- admin, login, SAML, groups audit logs

### Premium

Device management capabilities:

- advanced mobile device management
- security key enforcement
- mobile audit

Directory:

- no user cap on user accounts

SSO:

- automated user provisioning

Security:

- google security center

Reporting:

- device audit logs
- auto export logs to BigQuery

## Active Directory - Microsoft

Not a Google service, but a directory service that can be integrated with Google Cloud.

Ideated by Microsoft to give organizations the ability to manage multiple on-premise components using a single identity per user.

Terminology:

- **Domain**: a logical grouping of AD objects (users, computers, etc.) in a network.
- **Domain Controller**: a server that responds to security authentication requests within the domain.
- **Domain Computer**: a computer that is registered with a central authentication database. It is an AD object that is managed by the domain controller.
- **AD Object**: basic element of AD, such as a user, computer, or group.
- **Group Policy Object (GPO)**: a collection of settings that control what AD Objects have access to.
- **Organizational Unit (OU)**: a subdivision in Active Directory that can contain users, groups, and computers.
- **Directory Service**
  - e.g. Active Directory Domain Services (AD DS)

### Active Directory Domain Services (AD DS)

Built out of many Directory Services.

Domain Services = foundation of every Windows domain network

- the server running AD DS is called a *domain controller*
- stores information about members of the domain, including devices and users

## Managed service for Microsoft Active Directory

AD hosted on Google Cloud. Useful to federate with existing on-premise AD.

- It is compatible with AD-compatible apps
- It is virtually maintenance-free
- multi-region deployment
- hybrid identity support (on-premise and cloud)

## Identity providers

An entity that maintains and manages identity information and provides authentication services to a federation of applications and services.

Federate identity = method of linking a user's identity across multiple identity management systems.

- OpenID --> provides authentication
- Oauth2.0 --> industry standard, uses tokens for authorization
- SAML --> SSO on the web

### LDAP

LDAP = Lightweight Directory Access Protocol

Open, vendor-neutral protocol for accessing and maintaining distributed directory information services.

Common use cases:

- provide a central place to store username and passwords
- SSO systems are often built on top of LDAP.
- some systems support LDAP for authentication, but not SSO

## Google Cloud Directory Sync (GCDS)

Enables admins to sync users, groups and other data from an Active Directory/LDAP service to Cloud Identity.