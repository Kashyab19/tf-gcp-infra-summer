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
  service_account_email = module.service_account.email
  startup_script    = templatefile("${path.module}/startup_script.tpl", {
    APPLICATION_NAME              = "webapp"
    SERVICE_NAME                  = "webapp.service"
    GCP_PROJECT_ID                = var.project_id
    DB_USER = module.cloudsql.sql_user_name
    DB_PASS = "tZ-.5aP}j@+fY:z("
    DB_NAME = module.cloudsql.sql_database_name
    DB_HOST = module.cloudsql.sql_instance_ip
    JWT_SECRET = ""
    DB_PORT=var.port
    PUBSUB_TOPIC="verify_email"
    # Construct the DATABASE_URL
    #DATABASE_URL      = "postgres://${module.cloudsql.sql_user_name}:${module.cloudsql.sql_user_password}@/${module.cloudsql.sql_database_name}?host=/cloudsql/${module.cloudsql.sql_instance_connection_name}"
  })
}

module "dns" {
  source                  = "./dns"
  webapp_domain_name      = "kashyabcloudapp.me."
  webapp_dnsrecord_type   = "A"
  webapp_dns_ttl          = 300
  managed_zone_webapp     = "my-new-zone"  # The name of your existing managed zone
  global_ip               = module.compute_instance.instance_ip
}

module "service_account" {
  source       = "./service_account"
  account_id   = "vm-service-account"
  display_name = "VM Service Account"
  project_id   = var.project_id
}

module "iam" {
  source                = "./iam"
  project_id            = var.project_id
  service_account_email = module.service_account.email
}

module "secret_manager" {
  source     = "./secret_manager"
  project_id = var.project_id
}

module "pubsub" {
  source     = "./pubsub"
  # project_id = var.project_id
  # region     = var.region
}

resource "google_storage_bucket" "function_bucket" {
  name                        = "numeric-gcf-source"
  location                    = var.region
  uniform_bucket_level_access = true
}

data "archive_file" "function_zip" {
  type        = "zip"
  output_path = "/tmp/function-source.zip"
  source_dir  = "../serverless-fork/"
}

resource "google_storage_bucket_object" "function_zip" {
  name   = "function-source.zip"
  bucket = google_storage_bucket.function_bucket.name
  source = data.archive_file.function_zip.output_path
}

module "cloudfunctions" {
  source               = "./cloudfunctions"
  project_id           = var.project_id
  region               = var.region
  function_source_bucket = google_storage_bucket.function_bucket.name
  function_source_object = google_storage_bucket_object.function_zip.name
  db_user              = module.cloudsql.sql_user_name
  db_password          = "tZ-.5aP}j@+fY:z("
  db_name              = module.cloudsql.sql_database_name
  db_host              = module.cloudsql.sql_instance_ip
  postmark_from_email  = "murali.k@northeastern.edu"
  service_account_email = module.service_account.email
  pubsub_topic         = module.pubsub.pubsub_topic_name
}