variable "zone_id" {
  description = "Cloudflare zone ID for synthphone-e.com"
  type        = string
}

variable "comment" {
  description = "Comment applied to managed DNS records"
  type        = string
}

variable "target" {
  description = "Target hostname for site aliases"
  type        = string
}
