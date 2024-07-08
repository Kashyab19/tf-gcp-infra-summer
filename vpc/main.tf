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
}

resource "google_compute_subnetwork" "db" {
  name          = var.subnet2
  ip_cidr_range = var.db_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc.self_link
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
