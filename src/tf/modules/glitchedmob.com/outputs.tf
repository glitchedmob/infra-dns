output "managed_record_ids" {
  description = "Managed glitchedmob.com DNS record IDs"
  value = merge(
    {
      "glitchedmob.com/MX"               = cloudflare_dns_record.glitchedmob_com_mx.id
      "glitchedmob.com/SES-verification" = cloudflare_dns_record.glitchedmob_com_ses_verification.id
    },
    {
      for name, record in cloudflare_dns_record.core :
      "${name}.glitchedmob.com" => record.id
    },
  )
}
