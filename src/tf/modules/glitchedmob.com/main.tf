terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

resource "cloudflare_dns_record" "glitchedmob_com_mx" {
  zone_id  = var.zone_id
  name     = "@"
  type     = "MX"
  content  = "inbound-smtp.us-east-1.amazonaws.com"
  priority = 10
  comment  = var.comment
  proxied  = false
  ttl      = 1
}

resource "cloudflare_dns_record" "glitchedmob_com_ses_verification" {
  zone_id = var.zone_id
  name    = "_amazonses"
  type    = "TXT"
  content = "TVRzzPMY85FSk52A1MgWiiob1d3sKtayYz8cGA7Y2VI="
  comment = var.comment
  proxied = false
  ttl     = 1
}
