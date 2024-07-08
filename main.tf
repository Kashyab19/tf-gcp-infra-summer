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
}
