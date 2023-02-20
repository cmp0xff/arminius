terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.53.1"
    }
  }
}

provider "google" {
    project     = "arminius-demo-dev"
    region      = "europe-west3"
}

resource "google_storage_bucket" "terraform_state" {
    name          = "arminius-demo-terraform-dev"
    location      = "europe-west3"
    force_destroy = true

    public_access_prevention = "enforced"

    lifecycle_rule {
        action {
            type = "Delete"
        }
        condition {
           num_newer_versions = 8
        }
    }

    versioning {
        enabled = true
    }

    labels = {
        "stack" = "dev"
    }
}