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
