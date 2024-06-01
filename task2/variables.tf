variable "project_id" {
  type    = string
  default = "smiling-algebra-416401"
}

variable "region" {
  type    = string
  default = "us-east1"
}

variable "zone" {
  type    = string
  default = "us-east1-b"
}

variable "credentials" {
  type    = string
  default = "balerica-key.json"
}

variable "location" {
  type    = string
  default = "US"
}

variable "vpc1" {
  type    = string
  default = "vpc1"
}

variable "sub1" {
  type    = string
  default = "sub1"
}
variable "vm" {
  type    = string
  default = "task2-vm"
}
variable "ip_cidr_range" {
  type        = string
  description = "IP CIDR range for the subnet"
  default     = "10.67.0.0/24"
}

 
