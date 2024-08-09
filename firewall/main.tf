resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["8080", "22"]  # Replace 80 with your application port if different
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-webapp-firewall" {
  name    = "allow-firewall-db-${0}"
  network = var.network

  allow {
    protocol = "tcp"
    ports = ["5432"]

  }
  source_ranges = ["10.62.0.0/16"]
  direction = "EGRESS"
  priority = 500
}

resource "google_compute_firewall" "deny_ssh" {
  name    = "deny-ssh"
  network = var.network

  deny {
    protocol = "tcp"
    ports    = [""]
  }

  source_ranges = ["0.0.0.0/0"]
}
