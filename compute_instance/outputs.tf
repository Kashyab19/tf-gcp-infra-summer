output "instance_name" {
  value = google_compute_instance.custom_instance.name
}

output "instance_self_link" {
  value = google_compute_instance.custom_instance.self_link
}
