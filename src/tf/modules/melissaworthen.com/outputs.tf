output "managed_record_ids" {
  description = "Managed melissaworthen.com DNS record IDs"
  value = merge(
    {
      "melissaworthen.com/MX"                     = cloudflare_dns_record.melissaworthen_com_mx.id
      "melissaworthen.com/SPF"                    = cloudflare_dns_record.melissaworthen_com_spf.id
      "melissaworthen.com/DMARC"                  = cloudflare_dns_record.melissaworthen_com_dmarc.id
      "melissaworthen.com/Microsoft-verification" = cloudflare_dns_record.melissaworthen_com_microsoft_verification.id
      "melissaworthen.com/autodiscover"           = cloudflare_dns_record.melissaworthen_com_autodiscover.id
    },
    {
      for selector, record in cloudflare_dns_record.melissaworthen_com_dkim :
      "melissaworthen.com/DKIM/${selector}" => record.id
    },
  )
}
