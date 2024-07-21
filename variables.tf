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


