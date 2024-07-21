provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source             = "./vpc"
  vpc_name           = var.vpc_name
  region             = var.region
  webapp_subnet_cidr = var.webapp_subnet_cidr
  db_subnet_cidr     = var.db_subnet_cidr
  subnet1            = var.subnet1
  subnet2            = var.subnet2
  project_id         = var.project_id
}

module "firewall" {
  source  = "./firewall"
  network = module.vpc.vpc_self_link
}

# module "compute_instance" {
#   source  = "./compute_instance"
#   network = module.vpc.vpc_self_link
#   subnet  = module.vpc.webapp_subnet_self_link
#   image   = var.custom_image
#   zone    = var.zone
# }


module "cloudsql" {
  project_id         = var.project_id
  source            = "./cloudsql"
  instance_name     = "webapp-instance"
  region            = var.region
  disk_type         = "PD_SSD"
  disk_size         = 100
  availability_type = "REGIONAL"
  deletion_protection = false
  ipv4_enabled      = false
  private_network   = module.vpc.vpc_self_link
  db_name           = "webapp"
  db_user           = "webapp"
  private_vpc_connection = module.vpc.private_vpc_connection_name
}

module "compute_instance" {
  source   = "./compute_instance"
  network  = module.vpc.vpc_self_link
  subnet   = module.vpc.webapp_subnet_self_link
  image    = var.custom_image
  zone     = var.zone
  startup_script    = templatefile("${path.module}/startup_script.tpl", {
    DB_USER = module.cloudsql.sql_user_name
    DB_PASS = module.cloudsql.sql_user_password
    DB_NAME = module.cloudsql.sql_database_name
    DB_HOST = module.cloudsql.sql_instance_name
  })
}