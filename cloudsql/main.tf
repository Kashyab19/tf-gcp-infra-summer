resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "default" {
  provider = google-beta
  project = var.project_id
  name             = "private-instance-${random_id.db_name_suffix.hex}"
  region           = var.region
  database_version = "POSTGRES_13"
  depends_on = [var.private_vpc_connection]
  deletion_protection = var.deletion_protection
  settings {
    tier              = "db-f1-micro"
    disk_type         = var.disk_type
    disk_size         = var.disk_size
    availability_type = var.availability_type

    ip_configuration {
      ipv4_enabled                                  = var.ipv4_enabled
      private_network                               = var.private_network
      enable_private_path_for_google_cloud_services = true
    }
  }
}

resource "google_sql_database" "default" {
  name     = var.db_name
  instance = google_sql_database_instance.default.name
}

resource "random_password" "default" {
  length  = 16
  special = true
}

resource "google_sql_user" "default" {
  name     = var.db_user
  instance = google_sql_database_instance.default.name
  password = random_password.default.result
}