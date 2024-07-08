output "vpc_self_link" {
  description = "The self-link of the VPC"
  value       = google_compute_network.vpc.self_link
}

output "webapp_subnet_self_link" {
  description = "The self-link of the webapp subnet"
  value       = google_compute_subnetwork.webapp.self_link
}

output "db_subnet_self_link" {
  description = "The self-link of the db subnet"
  value       = google_compute_subnetwork.db.self_link
}
