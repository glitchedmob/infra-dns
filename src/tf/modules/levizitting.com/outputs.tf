output "managed_record_ids" {
  description = "Managed levizitting.com DNS record IDs"
  value = merge(
    {
      for name, record in cloudflare_dns_record.core :
      "${name}.levizitting.com" => record.id
    },
    {
      "levizitting.com/MX"                     = cloudflare_dns_record.levizitting_com_mx.id
      "levizitting.com/SPF"                    = cloudflare_dns_record.levizitting_com_spf.id
      "levizitting.com/DMARC"                  = cloudflare_dns_record.levizitting_com_dmarc.id
      "levizitting.com/BIMI"                   = cloudflare_dns_record.levizitting_com_bimi.id
      "levizitting.com/Microsoft-verification" = cloudflare_dns_record.levizitting_com_microsoft_verification.id
      "levizitting.com/autodiscover"           = cloudflare_dns_record.levizitting_com_autodiscover.id
    },
    {
      for selector, record in cloudflare_dns_record.levizitting_com_dkim :
      "levizitting.com/DKIM/${selector}" => record.id
    },
    {
      for server, record in cloudflare_dns_record.email_levizitting_com_mx :
      "email.levizitting.com/MX/${server}" => record.id
    },
    {
      "email.levizitting.com/SPF"  = cloudflare_dns_record.email_levizitting_com_spf.id
      "email.levizitting.com/DKIM" = cloudflare_dns_record.email_levizitting_com_dkim.id
    },
    {
      for endpoint, record in cloudflare_dns_record.email_levizitting_com_access :
      "email.levizitting.com/${endpoint}" => record.id
    },
  )
}
