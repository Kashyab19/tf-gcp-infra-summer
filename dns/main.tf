resource "google_dns_record_set" "webapp_dns_records" {
  name         = var.webapp_domain_name
  type         = var.webapp_dnsrecord_type
  ttl          = var.webapp_dns_ttl
  managed_zone = var.managed_zone_webapp

  rrdatas = [var.global_ip] 
}
