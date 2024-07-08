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
