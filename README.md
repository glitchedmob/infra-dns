# infra-dns

Manages Cloudflare DNS records for `levizitting.com` as code.

## Scope
- Owns: Cloudflare DNS records declared in this repo for the `levizitting.com` zone.
- Owns: Terraform/OpenTofu state for DNS changes in this stack.

## Structure
- `src/tf/`: OpenTofu DNS resources, provider config, backend config, and outputs.
- `.github/workflows/`: Plan/validate/apply automation for DNS changes.

## Run
```bash
make help
make tf-init
make tf-plan
make tf-apply
make tf-output
```
