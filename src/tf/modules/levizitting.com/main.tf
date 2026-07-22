terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

locals {
  records = {
    "hello-nginx" = {
      type    = "CNAME"
      content = var.x86_public_vps_target
      proxied = false
      ttl     = 300
    }
    "test-service" = {
      type    = "CNAME"
      content = var.x86_public_vps_target
      proxied = false
      ttl     = 300
    }
    "uptime" = {
      type    = "CNAME"
      content = var.x86_public_vps_target
      proxied = true
      ttl     = 1
    }
  }
}

resource "cloudflare_dns_record" "core" {
  for_each = local.records

  zone_id = var.zone_id
  name    = each.key
  type    = each.value.type
  content = each.value.content
  comment = var.comment
  proxied = each.value.proxied
  ttl     = each.value.ttl
}
