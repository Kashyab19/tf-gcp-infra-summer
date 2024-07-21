resource "google_compute_instance" "custom_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

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

  metadata_startup_script = var.startup_script
}
