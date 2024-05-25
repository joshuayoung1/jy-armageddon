terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.27.0"
    }
  }
}

provider "google" {
  project     = var.project_id  //"smiling-algebra-416401"
  region      = var.region      //"us-east1"
  zone        = var.zone        //"us-east1-b"
  credentials = var.credentials //"balerica-key.json"
}