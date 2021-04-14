# Setup Terroform

To avoid sharing secure cedentials of the proxmox configuration, you need to create a new file in this folder. The file is called _provider.tf_

```bash
touch provider.tf
```

insert the following lines and fill the placeholder with your login informations and connection string.
```terraform
provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = "https://127.0.0.1/api2/json"
    pm_user = "root@pam"
    pm_password = "PASSWORD"
}
```
As an alternative you can add the provider definition to the _terraform.tf_ file, but this is not recommendet in production use.

## More Information
For the used proxmox provider you finde more information in the [documentation][link-proxmox-provider-github] on github.

[//]: # (Links used in the document.)

[link-proxmox-provider-github]: https://github.com/Telmate/terraform-provider-proxmox/blob/master/docs/index.md