locals {
  email_levizitting_com_dkim_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxMubiOeLDtNb5zGmFloX15FeqvqFAcpplch14huB+84Uk0EkG9h9gV0TNPTYiGiLvqGmtcni8mAks48eaPYx6ZpAB5Wijb5j11h7nDB9DkAB2//7IJ07O/GPn4pqztw9tyCgPlMydmNAltBufjMnvljoEVEvuhotOrOQp8bn+KQwUpSgAKXo4VAjIshn8rLRW2XQEZwUF4Q5/4jT+0tm5k+bKG4Dk8NfaK0Ls/Pl1W03avTeTt7jaEZd8ozLyqvSMp5g5Xtw506waXSCfCoq34VUkGyF7sVGkshF2BjefhhD92Q+8AZGCJxFoAcv89pzS5Mhk+EdjswKAzJyFeZQSQIDAQAB"
}

resource "cloudflare_dns_record" "levizitting_com_mx" {
  zone_id  = data.cloudflare_zone.levizitting_com.id
  name     = "@"
  type     = "MX"
  content  = "levizitting-com.mail.eo.outlook.com"
  priority = 0
  comment  = local.dns_record_comment
  proxied  = false
  ttl      = 1
}

resource "cloudflare_dns_record" "levizitting_com_spf" {
  zone_id = data.cloudflare_zone.levizitting_com.id
  name    = "@"
  type    = "TXT"
  content = "v=spf1 include:spf.protection.outlook.com -all"
  comment = local.dns_record_comment
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "levizitting_com_dkim" {
  for_each = {
    selector_1 = {
      name    = "selector1._domainkey"
      content = "selector1-levizitting-com._domainkey.levizitting.onmicrosoft.com"
    }
    selector_2 = {
      name    = "selector2._domainkey"
      content = "selector2-levizitting-com._domainkey.levizitting.onmicrosoft.com"
    }
  }

  zone_id = data.cloudflare_zone.levizitting_com.id
  name    = each.value.name
  type    = "CNAME"
  content = each.value.content
  comment = local.dns_record_comment
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "email_levizitting_com_mx" {
  for_each = {
    primary = {
      content  = "pixel.mxrouting.net"
      priority = 10
    }
    secondary = {
      content  = "pixel-relay.mxrouting.net"
      priority = 20
    }
  }

  zone_id  = data.cloudflare_zone.levizitting_com.id
  name     = "email"
  type     = "MX"
  content  = each.value.content
  priority = each.value.priority
  comment  = local.dns_record_comment
  proxied  = false
  ttl      = 1
}

resource "cloudflare_dns_record" "email_levizitting_com_spf" {
  zone_id = data.cloudflare_zone.levizitting_com.id
  name    = "email"
  type    = "TXT"
  content = "v=spf1 include:mxlogin.com -all"
  comment = local.dns_record_comment
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "email_levizitting_com_dkim" {
  zone_id = data.cloudflare_zone.levizitting_com.id
  name    = "x._domainkey.email"
  type    = "TXT"
  content = "v=DKIM1; k=rsa; p=${local.email_levizitting_com_dkim_public_key}"
  comment = local.dns_record_comment
  proxied = false
  ttl     = 1
}
