locals {
  levizitting_com  = "levizitting.com"
  synthphone_e_com = "synthphone-e.com"
  electronuck_com  = "electronuck.com"
}

data "cloudflare_zone" "levizitting_com" {
  filter = {
    name = local.levizitting_com
  }
}

data "cloudflare_zone" "synthphone_e_com" {
  filter = {
    name = local.synthphone_e_com
  }
}

data "cloudflare_zone" "electronuck_com" {
  filter = {
    name = local.electronuck_com
  }
}
