variable "project_id" {
  description = "The project ID to deploy resources into"
  type        = string
}

variable "region" {
  description = "The region to deploy resources into"
  type        = string
  default     = "us-central1"
}

# variable "function_source" {
#   description = "Path to the Cloud Function source code"
#   type        = string
# }

variable "db_user" {
  description = "Database user"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_host" {
  description = "Cloud SQL instance connection name"
  type        = string
}

variable "postmark_from_email" {
  description = "The Postmark from email"
  type        = string
}

variable "service_account_email" {
  description = "Service account email for the Cloud Function"
  type        = string
}

variable "pubsub_topic" {
  description = "Pub/Sub topic to trigger the Cloud Function"
  type        = string
}

# variable "postmark_api_key_secret" {
#   description = "The resource name of the Postmark API key secret in Secret Manager"
#   type        = string
# }


variable "function_source_bucket" {
  description = "Pub/Sub topic to trigger the Cloud Function"
  type        = string
}

variable "function_source_object" {
  description = "Pub/Sub topic to trigger the Cloud Function"
  type        = string
}

variable "domain" {
  description = "domain to send emails from"
  type = string
  default = "http://kashyabcloudapp.me:8080"
}
