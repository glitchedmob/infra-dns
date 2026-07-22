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
      name     = "@"
      type     = "A"
      content  = "138.197.122.20"
      priority = null
    }
    mx_primary = {
      name     = "@"
      type     = "MX"
      content  = "mx.zoho.com"
      priority = 10
    }
    mx_secondary = {
      name     = "@"
      type     = "MX"
      content  = "mx2.zoho.com"
      priority = 20
    }
    spf = {
      name     = "@"
      type     = "TXT"
      content  = "v=spf1 include:zoho.com ~all"
      priority = null
    }
    www = {
      name     = "www"
      type     = "CNAME"
      content  = "unitedco.de"
      priority = null
    }
    zoho_verification = {
      name     = "zb15009376"
      type     = "CNAME"
      content  = "zmverify.zoho.com"
      priority = null
    }
  }
}

resource "cloudflare_dns_record" "core" {
  for_each = local.records

  zone_id  = var.zone_id
  name     = each.value.name
  type     = each.value.type
  content  = each.value.content
  priority = each.value.priority
  comment  = var.comment
  proxied  = false
  ttl      = 1
}
