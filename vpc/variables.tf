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

variable "region" {
  description = "The region in which to create the VPC and subnets"
  type        = string
}

variable "subnet1" {
  description = "The name of my subnet"
  type = string
}

variable "subnet2" {
  description = "The name of my subnet 2"
  type = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}


