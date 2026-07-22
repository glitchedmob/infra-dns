output "managed_record_ids" {
  description = "Managed levizitting.dev DNS record IDs"
  value = {
    for name, record in cloudflare_dns_record.core :
    "${name}.levizitting.dev" => record.id
  }
}
