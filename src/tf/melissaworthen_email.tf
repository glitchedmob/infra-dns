resource "cloudflare_dns_record" "melissaworthen_com_mx" {
  zone_id  = data.cloudflare_zone.melissaworthen_com.id
  name     = "@"
  type     = "MX"
  content  = "melissaworthen-com.mail.eo.outlook.com"
  priority = 0
  comment  = local.dns_record_comment
  proxied  = false
  ttl      = 1
}

resource "cloudflare_dns_record" "melissaworthen_com_spf" {
  zone_id = data.cloudflare_zone.melissaworthen_com.id
  name    = "@"
  type    = "TXT"
  content = "v=spf1 include:spf.protection.outlook.com -all"
  comment = local.dns_record_comment
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "melissaworthen_com_dkim" {
  for_each = {
    selector_1 = {
      name    = "selector1._domainkey"
      content = "selector1-melissaworthen-com._domainkey.levizitting.onmicrosoft.com"
    }
    selector_2 = {
      name    = "selector2._domainkey"
      content = "selector2-melissaworthen-com._domainkey.levizitting.onmicrosoft.com"
    }
  }

  zone_id = data.cloudflare_zone.melissaworthen_com.id
  name    = each.value.name
  type    = "CNAME"
  content = each.value.content
  comment = local.dns_record_comment
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "melissaworthen_com_dmarc" {
  zone_id = data.cloudflare_zone.melissaworthen_com.id
  name    = "_dmarc"
  type    = "TXT"
  content = "v=DMARC1; p=none; pct=100; rua=mailto:re+vkpmbl0w3qm@dmarc.postmarkapp.com; sp=none; aspf=r;"
  comment = local.dns_record_comment
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "melissaworthen_com_microsoft_verification" {
  zone_id = data.cloudflare_zone.melissaworthen_com.id
  name    = "@"
  type    = "TXT"
  content = "MS=ms43290222"
  comment = local.dns_record_comment
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "melissaworthen_com_autodiscover" {
  zone_id = data.cloudflare_zone.melissaworthen_com.id
  name    = "autodiscover"
  type    = "CNAME"
  content = "autodiscover.outlook.com"
  comment = local.dns_record_comment
  proxied = false
  ttl     = 1
}
