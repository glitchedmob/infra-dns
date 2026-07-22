output "managed_record_ids" {
  description = "Managed unitedco.de DNS record IDs"
  value = {
    for name, record in cloudflare_dns_record.core :
    "${name}.unitedco.de" => record.id
  }
}
