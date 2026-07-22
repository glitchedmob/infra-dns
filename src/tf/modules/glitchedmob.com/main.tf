terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

locals {
  records = {
    apex = {
      name    = "@"
      content = "apex-loadbalancer.netlify.com"
    }
    www = {
      name    = "www"
      content = "levizitting-prod.netlify.app"
    }
  }
}

resource "cloudflare_dns_record" "core" {
  for_each = local.records

  zone_id = var.zone_id
  name    = each.value.name
  type    = "CNAME"
  content = each.value.content
  comment = var.comment
  proxied = false
  ttl     = 1
}
