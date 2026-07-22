locals {
  dns_record_comment = "managedBy=tf,repo=glitchedmob/infra-dns"
  electronuck_target = "electronuck.netlify.app"
}

module "levizitting_com" {
  source = "./modules/levizitting.com"

  zone_id               = data.cloudflare_zone.levizitting_com.id
  comment               = local.dns_record_comment
  x86_public_vps_target = var.x86_public_vps_target
}

module "glitchedmob_com" {
  source = "./modules/glitchedmob.com"

  zone_id = data.cloudflare_zone.glitchedmob_com.id
  comment = local.dns_record_comment
}

module "melissaworthen_com" {
  source = "./modules/melissaworthen.com"

  zone_id = data.cloudflare_zone.melissaworthen_com.id
  comment = local.dns_record_comment
}

module "electronuck_com" {
  source = "./modules/electronuck.com"

  zone_id = data.cloudflare_zone.electronuck_com.id
  comment = local.dns_record_comment
  target  = local.electronuck_target
}

module "synthphone_e_com" {
  source = "./modules/synthphone-e.com"

  zone_id = data.cloudflare_zone.synthphone_e_com.id
  comment = local.dns_record_comment
  target  = local.electronuck_target
}

module "levizitting_dev" {
  source = "./modules/levizitting.dev"

  zone_id = data.cloudflare_zone.levizitting_dev.id
  comment = local.dns_record_comment
}

module "unitedco_de" {
  source = "./modules/unitedco.de"

  zone_id = data.cloudflare_zone.unitedco_de.id
  comment = local.dns_record_comment
}
