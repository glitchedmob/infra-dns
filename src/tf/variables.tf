variable "cloudflare_api_token" {
  description = "Cloudflare API token with DNS edit permissions"
  type        = string
  sensitive   = true
}

variable "aws_region" {
  description = "AWS region containing the SES identity"
  type        = string
  default     = "us-east-2"
}

variable "x86_public_vps_target" {
  description = "Target hostname for services hosted on the public x86 VPS"
  type        = string
  default     = "x86-vps-node-01.levizitting.com"
}
