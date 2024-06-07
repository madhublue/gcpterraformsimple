terraform {
  backend "gcs" {
    bucket  = "garbagebucket"
    prefix  = "terraform/state"
  }
}

variable "project_id" {
  description = "The project ID"
  
}
// create const for image tagg and use in  resources

variable "region" {
  description = "The region where the Cloud Run service will be deployed"
  default     = "us-central1"
  
}

variable "commit_sha" {
   description = "commit hash of the github repo"
}


provider "google" {
  project = var.project_id
  region  = var.region
  // in local uncomment the below line
  // credentials = file("localkitchen101-08aa9be91899.json")
}

resource "google_project_service" "cloud_run" {
  service = "run.googleapis.com"
}

resource "google_project_service" "container_registry" {
  service = "containerregistry.googleapis.com"
}

resource "google_cloud_run_service" "fastapi_gcp_third" {
  name     = "fastapi-gcp-third"
  location = var.region

  template {
    spec {
      containers {
        
        image = "us-central1-docker.pkg.dev/localkitchen101/lk-docker-repo/fastapi:${var.commit_sha}"
        

      }
    }
  }

  # Allow unauthenticated access
  # Remove this block if you want to restrict access
  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_binding" "invoker" {
  location = google_cloud_run_service.fastapi_gcp_third.location
  service  = google_cloud_run_service.fastapi_gcp_third.name

  role    = "roles/run.invoker"
  members = ["allUsers"]
}



output "service_url" {
  value = google_cloud_run_service.fastapi_gcp_third.status[0].url
}



