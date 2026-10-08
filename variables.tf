variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
}

variable "region" {
  description = "The region in which to provision resources."
  type        = string
}

variable "zone" {
  description = "The zone in which to provision resources."
  type        = string
}

variable "environment" {
  description = "The environment for which the resources are being provisioned (e.g., dev, staging, prod)."
  type        = string
}

variable "vm_name" {
  description = "The name of the Compute Engine instance."
  type        = string
  default     = "app-vm"

}
variable "machine_type" {
  description = "The machine type for the Compute Engine instance."
  type        = string
  default     = "e2-medium"
}
variable "db_user" {
  description = "The username for the database."
  type        = string
  default     = "aapuser"
}
variable "db_name" {
  description = "The name of the database."
  type        = string
  default     = "appdb"
}
variable "db_password" {
  description = "The password for the database."
  type        = string
  sensitive   = true
}
variable "bucket_name" {
  description = "The name of the Cloud Storage bucket."
  type        = string
  default     = "app-bucket123421"
}

variable "admin_ip" {
  description = "The IP address of the admin machine that will access the VM."
  type        = string
}