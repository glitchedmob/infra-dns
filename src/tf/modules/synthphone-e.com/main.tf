terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

locals {
  records = {
    "synthphone-e.com"     = "@"
    "www.synthphone-e.com" = "www"
  }
}

resource "cloudflare_dns_record" "site_aliases" {
  for_each = local.records

  zone_id = var.zone_id
  name    = each.value
  type    = "CNAME"
  content = var.target
  comment = var.comment
  proxied = false
  ttl     = 300
}
