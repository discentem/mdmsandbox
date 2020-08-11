## What is this? 

Terraform config for open-source mdm (micromdm/mdmdirector) with letsencrypt, systemd, and dns

## Disclaimer

This should not be considered secure by default or production ready. 

Various modifications should be made, such as: 
- Verifying the authenticity of downloads by sha256 hash/signing certificate or by using a proper, internal package management or build system
- Terraform state should be moved to a remote backend for security. See https://www.terraform.io/docs/state/sensitive-data.html for more information.
- `mdmdirector_api_password` could be generated on the VM during provisioning or retrieved from a secret store like Vault instead being provided as a terraform static variable.
- VM provisioning should be done via user-data/cloud-init and configuration management instead of a null_resource + remote-exec. Hashicorp states that user-data is a best practice and is preferred over remote-exec.
- TLS certificate and private key should be retrieved from a secure, external source (again Vault) to avoid hitting LetsEncrypt rate limits: if you attempt to request a brand new certificate for the same domain more than ~3 times, the operation will fail. 

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

For more in depth explanation of the following steps, see https://github.com/micromdm/micromdm/blob/main/docs/user-guide/quickstart.md#configure-mdmctl

4. `mdmctl config set -name production -api-token $micromdm_api_key -server-url https://mdm.domain.com`
5. ```mdmcert upload -cert push_cert_key.p12 -private-key mdm-certificates/VendorPrivateKey.key -password $privatekey_password```
6. Profit! 