variable "project_id" {
  description = "The ID of the project in which to create the VPC"
  type        = string
}

variable "region" {
  description = "The region in which to create the VPC and subnets"
  type        = string
  default     = "us-central1"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "webapp_subnet_cidr" {
  description = "The CIDR range of the webapp subnet"
  type        = string
}

variable "db_subnet_cidr" {
  description = "The CIDR range of the db subnet"
  type        = string
}

variable "subnet1" {
  description = "The name of my subnet"
  type        = string
}

variable "subnet2" {
  description = "The name of my subnet 2"
  type        = string
}

variable "custom_image" {
  description = "Custom image to use for the instance"
  type        = string
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "application_name" {
  description = "The name of the web application"
  type        = string
  default = "webapp"
}

variable "database_url" {
  description = "Database URL that is constructed in the startup script"
  type = string
  default = "localhost"
}

variable "jwt_secret"{
  description = "JWT Secret is also built in the startup script"
  type = string
  default = "value"
}

variable "port" {
  description = "Port Number"
  type = string
  default = "5432"
}


variable "service_name" {
  description = "The name of the service"
  type        = string
  default = "webapp.service"
}


variable "postmark_from_email" {
  description = "The Postmark from email"
  type        = string
  default = "murali.k@northeastern.edu"
}

variable "service_account_email" {
  description = "Service account email for the Cloud Function"
  type        = string
  default = ""
}

variable "pubsub_topic" {
  description = "Pub/Sub topic to trigger the Cloud Function"
  type        = string
  default = ""
}

# variable "function_source" {
#   description = "Path to the Cloud Function source code from main"
#   type        = string
#   default = "../function.zip"
# }

variable "function_source_bucket" {
  description = "Pub/Sub topic to trigger the Cloud Function main"
  type        = string
  default = ""
}

variable "function_source_object" {
  description = "Pub/Sub topic to trigger the Cloud Function main"
  type        = string
  default = ""
}
