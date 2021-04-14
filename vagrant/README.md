# Vagrant Setup

## Preperation
On a windows system please open the [Vagrantfile][file] and remove the comment for mount options.

## Start Controllhost
Run the *vagrant up* command

```bash
vagrant up
```

## After provision
Login via *vagrant ssh* and check if everything is working including the ssh forward.

```bash
vagrant ssh
```

To finish the setup, reboot the controllhost.

[//]: # (Links used in the document.)
[file]: Vagrantfile