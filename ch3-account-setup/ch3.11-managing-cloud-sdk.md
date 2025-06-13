# Managing the cloud SDK

Download, install and authenticate in the cloud sdk.

> [!NOTE]
> Can have only 1 active account at a time.

## Commands

- `gcloud auth list` -> check current active accounts
- `gcloud config set account ${account}` -> set active account
- `gcloud auth revoke ${account}` -> revoke all credentials for an account on my computer
- `gcloud info` -> find user directory with keys, configs...
- `gcloud auth application-default login` -> Authorize access to gcloud for application default credentials

### Configuration

"A nameset of gcloud cli properties", like a profile.

`gcloud config configurations create` -> create a new config

`gcloud config configurations list`

`gcloud config configurations activate ${name}` -> activate configuration

`gcloud config configurations describe ${name}` -> view config properties

### Projects

`gcloud config set ${property}` -> update a property of the active configuration

### Components

Installable parts of the SDK

`gcloud components list`

`gcloud components install ${name}`

`gcloud components remove ${name}`

`gcloud components update` -> update all components

## Gcloud interactive shell

Component of the SDK that offers autocompletion, suggestions, documentation...

Component: `beta`

Activate shell: `gcloud beta interactive`
