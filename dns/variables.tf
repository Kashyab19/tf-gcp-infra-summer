variable "webapp_domain_name" {
  description = "The domain name for the web application"
  type        = string
}

variable "webapp_dnsrecord_type" {
  description = "The type of DNS record"
  type        = string
}

variable "webapp_dns_ttl" {
  description = "The TTL for the DNS record"
  type        = number
}

variable "managed_zone_webapp" {
  description = "The managed zone for the web application"
  type        = string
}

variable "global_ip" {
  description = "The global IP address for the web application"
  type        = string
}
