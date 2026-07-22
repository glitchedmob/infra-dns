# infra-dns

Manages Cloudflare DNS records for multiple zones as code.

## Scope
- Owns: Cloudflare DNS records declared in this repo for `levizitting.com`, `levizitting.dev`, `glitchedmob.com`, `melissaworthen.com`, `electronuck.com`, `synthphone-e.com`, and `unitedco.de`.
- Owns: Terraform/OpenTofu state for DNS changes in this stack.

## Structure
- `src/tf/`: Root OpenTofu configuration, provider config, backend config, and stack outputs.
- `src/tf/modules/<domain>/`: Domain-specific DNS resources and outputs.
- `.github/workflows/`: Plan/validate/apply automation for DNS changes.

## Run
```bash
make help
make tf-init
make tf-plan
make tf-apply
make tf-output
```
