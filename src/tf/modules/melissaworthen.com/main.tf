terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

locals {
  records = {
    bing_verification = {
      name    = "a717549fa09a46d5c7b440d4ac880ba5"
      type    = "CNAME"
      content = "verify.bing.com"
    }
    atproto = {
      name    = "_atproto"
      type    = "TXT"
      content = "\"did=did:plc:2ijatugs4ubzespeujskzzey\""
    }
    squarespace_verification = {
      name    = "dzm2tdgt2p8fmwgbzsmz"
      type    = "CNAME"
      content = "verify.squarespace.com"
    }
    first_party_dns = {
      name    = "fp"
      type    = "CNAME"
      content = "melissaworthencom.clients.firstpartydns.com"
    }
    apex = {
      name    = "@"
      type    = "CNAME"
      content = "melissaworthen.netlify.app"
    }
    google_verification = {
      name    = "@"
      type    = "TXT"
      content = "google-site-verification=qhcERGaHlmqULlvWKYXhHh2bZS1u73DvqZlqCF2bDDU"
    }
    www = {
      name    = "www"
      type    = "CNAME"
      content = "melissaworthen.netlify.app"
    }
  }
}

resource "cloudflare_dns_record" "core" {
  for_each = local.records

  zone_id = var.zone_id
  name    = each.value.name
  type    = each.value.type
  content = each.value.content
  comment = var.comment
  proxied = false
  ttl     = 1
}

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
