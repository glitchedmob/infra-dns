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
