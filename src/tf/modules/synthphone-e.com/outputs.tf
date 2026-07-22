output "managed_record_ids" {
  description = "Managed synthphone-e.com DNS record IDs"
  value = {
    for name, record in cloudflare_dns_record.site_aliases :
    name => record.id
  }
}
