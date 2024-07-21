output "allow_http_rule" {
  value = google_compute_firewall.allow_http.name
}

output "deny_ssh_rule" {
  value = google_compute_firewall.deny_ssh.name
}
