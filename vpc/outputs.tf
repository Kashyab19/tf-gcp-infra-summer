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

output "network_id" {
  value = google_compute_network.vpc.id
}

output "web_app_subnet_id" {
  value = google_compute_subnetwork.webapp.id
}

output "db_subnet_id" {
  value = google_compute_subnetwork.db.id
}


output "private_vpc_connection_name" {
  value = google_service_networking_connection.private_service_connect.id
}

output "private_service_connect_ip" {
  value = google_compute_global_address.private_service_connect_ip.address
}

output "vpc_network" {
  value = google_compute_network.vpc
}