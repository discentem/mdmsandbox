## Disclaimer

This should not be considered secure by default or production ready. 

Various modifications should be made, such as: 
- Verifying the authenticity of downloads with hash/signing or using a proper, internal package management or build system
- mdmdirector password could be generated on the VM during provisioning or retrieved from a Secret Store like Vault
- VM provisioning should be done via user-data/cloud-init and configuration management instead of a null_resource + remote-exec. Hashicorp states that user-data is a best practice and is preferred over remote-exec.
- TLS certificate and private key should be retrieved from a secure, external source (again Vault) to avoid hitting LetsEncrypt rate limits. If you attempt to request a brand new certificate for the same domain more than ~3 times, the operation will fail. 

## Getting started

1. `terraform init`
2. create `secrets.auto.tfvars` with the following content. You can choose to omit any of these variables and instead be prompted for them on each `terraform apply` call.
```
do_token = "YOUR_TOKEN"

email = "YOUR_EMAIL@company.com"
dns_record = "MAIN_DNS"
micromdm_prefix = "mdm"

micromdm_api_key = "MAKE_UP_AN_API_KEY"
mdmdirector_api_key = "MAKE_UP_ANOTHER_API_KEY"

```
3. `terraform apply`
4. Profit! 