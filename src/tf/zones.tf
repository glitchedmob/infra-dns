locals {
  levizitting_com    = "levizitting.com"
  synthphone_e_com   = "synthphone-e.com"
  electronuck_com    = "electronuck.com"
  glitchedmob_com    = "glitchedmob.com"
  melissaworthen_com = "melissaworthen.com"
  levizitting_dev    = "levizitting.dev"
  unitedco_de        = "unitedco.de"
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

data "cloudflare_zone" "glitchedmob_com" {
  filter = {
    name = local.glitchedmob_com
  }
}

data "cloudflare_zone" "melissaworthen_com" {
  filter = {
    name = local.melissaworthen_com
  }
}

data "cloudflare_zone" "levizitting_dev" {
  filter = {
    name = local.levizitting_dev
  }
}

data "cloudflare_zone" "unitedco_de" {
  filter = {
    name = local.unitedco_de
  }
}
