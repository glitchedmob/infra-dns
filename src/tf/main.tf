locals {
  x86_public_vps_target = "x86-vps-node-01.levizitting.com"
  electronuck_target    = "electronuck.netlify.app"
  dns_record_comment    = "managedBy=tf,repo=glitchedmob/infra-dns"

  records = {
    "hello-nginx" = {
      type    = "CNAME"
      content = local.x86_public_vps_target
      proxied = false
      ttl     = 300
    }
    "test-service" = {
      type    = "CNAME"
      content = local.x86_public_vps_target
      proxied = false
      ttl     = 300
    }
    "uptime" = {
      type    = "CNAME"
      content = local.x86_public_vps_target
      proxied = true
      ttl     = 1
    }
  }

  site_aliases = {
    "synthphone-e.com" = {
      zone_id = data.cloudflare_zone.synthphone_e_com.id
      name    = "@"
      content = local.electronuck_target
    }
    "www.synthphone-e.com" = {
      zone_id = data.cloudflare_zone.synthphone_e_com.id
      name    = "www"
      content = local.electronuck_target
    }
    "electronuck.com" = {
      zone_id = data.cloudflare_zone.electronuck_com.id
      name    = "@"
      content = local.electronuck_target
    }
    "www.electronuck.com" = {
      zone_id = data.cloudflare_zone.electronuck_com.id
      name    = "www"
      content = local.electronuck_target
    }
  }
}

resource "cloudflare_dns_record" "core" {
  for_each = local.records

  zone_id = data.cloudflare_zone.levizitting_com.id
  name    = each.key
  type    = each.value.type
  content = each.value.content
  comment = local.dns_record_comment
  proxied = each.value.proxied
  ttl     = each.value.ttl
}

resource "cloudflare_dns_record" "site_aliases" {
  for_each = local.site_aliases

  zone_id = each.value.zone_id
  name    = each.value.name
  type    = "CNAME"
  content = each.value.content
  comment = local.dns_record_comment
  proxied = false
  ttl     = 300
}
