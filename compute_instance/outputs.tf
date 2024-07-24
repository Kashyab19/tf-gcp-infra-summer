output "instance_name" {
  value = google_compute_instance.custom_instance.name
}

output "instance_self_link" {
  value = google_compute_instance.custom_instance.self_link
}

output "instance_ip" {
  value = google_compute_instance.custom_instance.network_interface.0.access_config.0.nat_ip
}

