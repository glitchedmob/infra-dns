locals {
  x86_public_vps_target = "x86-vps-node-01.levizitting.com"
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
