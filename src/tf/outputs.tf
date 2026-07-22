output "cloudflare_zone_id" {
  description = "Cloudflare zone ID for managed zone"
  value       = data.cloudflare_zone.levizitting_com.id
}

output "x86_public_vps_target" {
  description = "Target hostname for hello-nginx CNAME"
  value       = local.x86_public_vps_target
}

output "managed_record_ids" {
  description = "Cloudflare DNS record IDs managed by this stack"
  value = merge(
    {
      for name, record in cloudflare_dns_record.core :
      "${name}.${local.levizitting_com}" => record.id
    },
    {
      for name, record in cloudflare_dns_record.site_aliases :
      name => record.id
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
    {
      "glitchedmob.com/MX"                        = cloudflare_dns_record.glitchedmob_com_mx.id
      "glitchedmob.com/SES-verification"          = cloudflare_dns_record.glitchedmob_com_ses_verification.id
      "melissaworthen.com/MX"                     = cloudflare_dns_record.melissaworthen_com_mx.id
      "melissaworthen.com/SPF"                    = cloudflare_dns_record.melissaworthen_com_spf.id
      "melissaworthen.com/DMARC"                  = cloudflare_dns_record.melissaworthen_com_dmarc.id
      "melissaworthen.com/Microsoft-verification" = cloudflare_dns_record.melissaworthen_com_microsoft_verification.id
      "melissaworthen.com/autodiscover"           = cloudflare_dns_record.melissaworthen_com_autodiscover.id
    },
    {
      for selector, record in cloudflare_dns_record.melissaworthen_com_dkim :
      "melissaworthen.com/DKIM/${selector}" => record.id
    }
  )
}
