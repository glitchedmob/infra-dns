output "cloudflare_zone_id" {
  description = "Cloudflare zone ID for managed zone"
  value       = data.cloudflare_zone.levizitting_com.id
}

output "x86_public_vps_target" {
  description = "Target hostname for hello-nginx CNAME"
  value       = var.x86_public_vps_target
}

output "managed_record_ids" {
  description = "Cloudflare DNS record IDs managed by this stack"
  value = merge(
    module.levizitting_com.managed_record_ids,
    module.glitchedmob_com.managed_record_ids,
    module.melissaworthen_com.managed_record_ids,
    module.electronuck_com.managed_record_ids,
    module.synthphone_e_com.managed_record_ids,
    module.levizitting_dev.managed_record_ids,
    module.unitedco_de.managed_record_ids,
  )
}
