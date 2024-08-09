output "sql_instance_name" {
  value = google_sql_database_instance.default.name
}

output "sql_database_name" {
  value = google_sql_database.default.name
}

output "sql_user_name" {
  value = google_sql_user.default.name
}

output "sql_user_password" {
  value = random_password.generated_password.result
  sensitive = true
}

output "sql_instance_connection_name" {
  value = google_sql_database_instance.default.connection_name
}

output "sql_instance_ip" {
  value = google_sql_database_instance.default.ip_address.0.ip_address
}