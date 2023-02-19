terraform {
    required_providers {
        google = {
            source  = "hashicorp/google"
            version = "~> 4.53.1"
        }
    }
    backend "gcs" {
        bucket = "arminius-demo-terraform-dev"
        prefix = "state"
    }
}

provider "google" {
    project     = var.project_id
    region      = var.region
}