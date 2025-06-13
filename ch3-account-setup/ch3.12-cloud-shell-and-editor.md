# Cloud shell and editor

Ephemeral `e2-small` VM with docker container with a persistent 5GB home directory storage. Has a built-in code editor.
The instance persists while the user is online, after 1 hour of inactivity, the session is deleted.

## Environment customization

Create a file named `.customize_environment` and edit it using the cloud editor.

`touch .customize_environment`

`edit .customize_environment` -> opens editor

Edit the file:

```
#!/bin/sh
...
```

and restart the shell
