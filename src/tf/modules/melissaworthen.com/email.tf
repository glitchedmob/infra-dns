resource "cloudflare_dns_record" "melissaworthen_com_mx" {
  zone_id  = var.zone_id
  name     = "@"
  type     = "MX"
  content  = "melissaworthen-com.mail.eo.outlook.com"
  priority = 0
  comment  = var.comment
  proxied  = false
  ttl      = 1
}

resource "cloudflare_dns_record" "melissaworthen_com_spf" {
  zone_id = var.zone_id
  name    = "@"
  type    = "TXT"
  content = "v=spf1 include:spf.protection.outlook.com -all"
  comment = var.comment
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

  zone_id = var.zone_id
  name    = each.value.name
  type    = "CNAME"
  content = each.value.content
  comment = var.comment
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "melissaworthen_com_dmarc" {
  zone_id = var.zone_id
  name    = "_dmarc"
  type    = "TXT"
  content = "v=DMARC1; p=none; pct=100; rua=mailto:re+vkpmbl0w3qm@dmarc.postmarkapp.com; sp=none; aspf=r;"
  comment = var.comment
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "melissaworthen_com_microsoft_verification" {
  zone_id = var.zone_id
  name    = "@"
  type    = "TXT"
  content = "MS=ms43290222"
  comment = var.comment
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "melissaworthen_com_autodiscover" {
  zone_id = var.zone_id
  name    = "autodiscover"
  type    = "CNAME"
  content = "autodiscover.outlook.com"
  comment = var.comment
  proxied = false
  ttl     = 1
}
