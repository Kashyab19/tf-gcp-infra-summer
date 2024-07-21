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
  value = random_password.default.result
  sensitive = true
}
