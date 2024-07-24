resource "google_compute_instance" "custom_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  allow_stopping_for_update = true
  boot_disk {
    initialize_params {
      image = var.image
      type  = var.disk_type
      size  = var.disk_size
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnet
    access_config {
      // Ephemeral public IP
    }
  }

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }

  metadata_startup_script = var.startup_script
}
