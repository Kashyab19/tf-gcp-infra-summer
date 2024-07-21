variable "instance_name" {
  description = "Name of the compute instance"
  type        = string
  default     = "custom-instance"
}

variable "machine_type" {
  description = "Machine type for the instance"
  type        = string
  default     = "e2-medium"
}

variable "zone" {
  description = "Zone to deploy the instance"
  type        = string
  default     = "us-central1-a"
}

variable "image" {
  description = "Custom image to use for the instance"
  type        = string
}

variable "disk_type" {
  description = "Boot disk type"
  type        = string
  default     = "pd-balanced"
}

variable "disk_size" {
  description = "Boot disk size in GB"
  type        = number
  default     = 100
}

variable "network" {
  description = "The network to attach the instance"
  type        = string
}

variable "subnet" {
  description = "The subnet to attach the instance"
  type        = string
}

variable "startup_script" {
  description = "Startup script to initialize the instance"
  type        = string
}
