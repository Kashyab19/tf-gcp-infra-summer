variable "instance_name" {
  description = "Name of the CloudSQL instance"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "disk_type" {
  description = "Type of disk"
  type        = string
  default     = "PD_SSD"
}

variable "disk_size" {
  description = "Size of disk in GB"
  type        = number
  default     = 100
}

variable "availability_type" {
  description = "Availability type"
  type        = string
  default     = "REGIONAL"
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}

variable "ipv4_enabled" {
  description = "Enable IPv4"
  type        = bool
  default     = false
}

variable "private_network" {
  description = "Private network"
  type        = string
}

variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "db_user" {
  description = "Name of the database user"
  type        = string
}

variable "private_vpc_connection" {
  description = "Name of the private VPC connection"
  type        = string
}

variable "project_id" {
  description = "Project ID"
  type = string
}