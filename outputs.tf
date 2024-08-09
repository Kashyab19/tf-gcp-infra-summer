output "vpc_self_link" {
  description = "The self-link of the VPC"
  value       = module.vpc.vpc_self_link
}

output "webapp_subnet_self_link" {
  description = "The self-link of the webapp subnet"
  value       = module.vpc.webapp_subnet_self_link
}

output "db_subnet_self_link" {
  description = "The self-link of the db subnet"
  value       = module.vpc.db_subnet_self_link
}

output "firewall_http" {
  value = module.firewall.allow_http_rule
}

output "firewall_ssh" {
  value = module.firewall.deny_ssh_rule
}

output "sql_instance_name" {
  value = module.cloudsql.sql_instance_name
}

output "sql_database_name" {
  value = module.cloudsql.sql_database_name
}

output "sql_user_name" {
  value = module.cloudsql.sql_user_name
}

output "sql_user_password" {
  value = module.cloudsql.sql_user_password
  sensitive = true
}

output "instance_name" {
  value = module.compute_instance.instance_name
}

output "instance_self_link" {
  value = module.compute_instance.instance_self_link
}

output "sql_instance_connection_name" {
  value = module.cloudsql.sql_instance_connection_name
}

# output "database_url_output" {
#   value = module.compute_instance.database_url
# }


output "cloud_function_url" {
  description = "The URL of the deployed Cloud Function"
  value       = module.cloudfunctions.cloud_function_url
}

output "pubsub_topic_name" {
  description = "The name of the Pub/Sub topic"
  value       = module.pubsub.pubsub_topic_name
}

output "service_account_email" {
  description = "The email of the service account"
  value       = module.service_account.email
}