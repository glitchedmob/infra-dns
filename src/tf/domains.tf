locals {
  levizitting_com = "levizitting.com"
}

data "cloudflare_zone" "levizitting_com" {
  filter = {
    name = local.levizitting_com
  }
}
