terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }

    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

locals {
  records = {
    "hello-nginx" = {
      name    = "hello-nginx"
      type    = "CNAME"
      content = var.x86_public_vps_target
      proxied = false
      ttl     = 300
    }
    id = {
      name    = "id"
      type    = "CNAME"
      content = var.k3s_tunnel_target
      proxied = true
      ttl     = 1
    }
    k8s_oidc_edge = {
      name    = "k8s-oidc-edge"
      type    = "CNAME"
      content = var.x86_public_vps_target
      proxied = true
      ttl     = 1
    }
    k8s_oidc_lz = {
      name    = "k8s-oidc-lz"
      type    = "CNAME"
      content = var.k3s_tunnel_target
      proxied = true
      ttl     = 1
    }
    "test-service" = {
      name    = "test-service"
      type    = "CNAME"
      content = var.k3s_tunnel_target
      proxied = true
      ttl     = 1
    }
    tandoor = {
      name    = "tandoor"
      type    = "CNAME"
      content = var.k3s_tunnel_target
      proxied = true
      ttl     = 1
    }
    "uptime" = {
      name    = "uptime"
      type    = "CNAME"
      content = var.x86_public_vps_target
      proxied = true
      ttl     = 1
    }
    bing_verification = {
      name    = "2a332c5c08ec71f674f52f37744d10d4"
      type    = "CNAME"
      content = "verify.bing.com"
      proxied = false
      ttl     = 1
    }
    alwaysblue = {
      name    = "alwaysblue"
      type    = "A"
      content = "10.0.0.3"
      proxied = false
      ttl     = 1
    }
    atproto = {
      name    = "_atproto"
      type    = "TXT"
      content = "did=did:plc:4f6qd4krxza6nk5wtjrehueh"
      proxied = false
      ttl     = 1
    }
    bighead = {
      name    = "bighead"
      type    = "A"
      content = "10.0.0.4"
      proxied = false
      ttl     = 1
    }
    grocy = {
      name    = "grocy"
      type    = "CNAME"
      content = "middleout.levizitting.com"
      proxied = true
      ttl     = 1
    }
    apex = {
      name    = "@"
      type    = "CNAME"
      content = "apex-loadbalancer.netlify.com"
      proxied = false
      ttl     = 1
    }
    google_verification = {
      name    = "@"
      type    = "TXT"
      content = "google-site-verification=_BW8sGulGlIXQmGuiH1uD4FS5-My3W0tgRX-86-ITXM"
      proxied = false
      ttl     = 1
    }
    keybase_verification = {
      name    = "@"
      type    = "TXT"
      content = "keybase-site-verification=MqGqoBY95bek4wS5fFq8N1C1zgN7-68U9NhvDJ4HmeA"
      proxied = false
      ttl     = 1
    }
    middleout_ipv4 = {
      name    = "middleout"
      type    = "A"
      content = "45.76.23.54"
      proxied = false
      ttl     = 1
    }
    middleout_ipv6 = {
      name    = "middleout"
      type    = "AAAA"
      content = "2001:19f0:5c00:1ee8:5400:4ff:fe37:1e8d"
      proxied = false
      ttl     = 1
    }
    nothotdog = {
      name    = "nothotdog"
      type    = "A"
      content = "10.0.0.5"
      proxied = false
      ttl     = 1
    }
    middleout_ownercheck = {
      name    = "ownercheck.middleout"
      type    = "TXT"
      content = "6070ea61"
      proxied = false
      ttl     = 1
    }
    pipey = {
      name    = "pipey"
      type    = "A"
      content = "10.0.0.6"
      proxied = false
      ttl     = 1
    }
    slides = {
      name    = "slides"
      type    = "CNAME"
      content = "levi-zitting-slides.netlify.app"
      proxied = false
      ttl     = 1
    }
    sparky = {
      name    = "sparky"
      type    = "CNAME"
      content = var.k3s_tunnel_target
      proxied = true
      ttl     = 1
    }
    www = {
      name    = "www"
      type    = "CNAME"
      content = "levizitting-prod.netlify.app"
      proxied = false
      ttl     = 1
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
  proxied = each.value.proxied
  ttl     = each.value.ttl
}

resource "cloudflare_zone_setting" "websockets" {
  zone_id    = var.zone_id
  setting_id = "websockets"
  value      = "on"
}
