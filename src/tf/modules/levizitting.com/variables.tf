variable "zone_id" {
  description = "Cloudflare zone ID for levizitting.com"
  type        = string
}

variable "comment" {
  description = "Comment applied to managed DNS records"
  type        = string
}

variable "aws_region" {
  description = "AWS region containing the SES identity"
  type        = string
}

variable "x86_public_vps_target" {
  description = "Target hostname for services hosted on the public x86 VPS"
  type        = string
}

variable "k3s_tunnel_target" {
  description = "Cloudflare Tunnel target for services hosted on the LZ k3s cluster"
  type        = string
}
