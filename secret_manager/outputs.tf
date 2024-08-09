
output "jwt_secret_version_name" {
  value = google_secret_manager_secret_version.jwt_secret_version.name
}
