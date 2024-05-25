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

variable "bucket_url" {
  type        = string
  description = "Google storage bucket URL"
  default     = "https://storage.googleapis.com/"
}