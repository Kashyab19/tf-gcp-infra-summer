resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "webapp" {
  name          = var.subnet1
  ip_cidr_range = var.webapp_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc.self_link
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "db" {
  name          = var.subnet2
  ip_cidr_range = var.db_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc.self_link
  private_ip_google_access = true
}

resource "google_compute_route" "webapp_default_route" {
  name           = "webapp-default-route"
  network        = google_compute_network.vpc.self_link
  dest_range     = "0.0.0.0/0"
  next_hop_gateway = "default-internet-gateway"
  priority       = 1000

  tags = ["webapp"]

  depends_on = [google_compute_subnetwork.webapp]
}


resource "google_compute_global_address" "private_service_connect_ip" {
  provider     = google-beta
  project      = var.project_id
  name         = "global-psconnect-ip"
  address_type = "INTERNAL"
  purpose      = "VPC_PEERING"
  network      = google_compute_network.vpc.self_link
  prefix_length = 16
}

resource "google_service_networking_connection" "private_service_connect" {
  provider                 = google-beta
  network                 = google_compute_network.vpc.self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_service_connect_ip.name]
}