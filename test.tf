variable "project_id" {
  description = "The project ID"
  
}
// create const for image tagg and use in  resources
variable "image_tag" {
  description = "The image tag"
}
variable "region" {
  description = "The region where the Cloud Run service will be deployed"
  default     = "us-central1"
  
}


provider "google" {
  project = var.project_id
  region  = var.region
  credentials = file("localkitchen101-08aa9be91899.json")
}

resource "google_project_service" "cloud_run" {
  service = "run.googleapis.com"
}

resource "google_project_service" "container_registry" {
  service = "containerregistry.googleapis.com"
}

resource "google_cloud_run_service" "fastapi_service_sample" {
  name     = "fastapi-service-sample"
  location = var.region

  template {
    spec {
      containers {
        
        image = "us-central1-docker.pkg.dev/localkitchen101/lk-docker-repo/fastapi:1.1"
        

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
  location = google_cloud_run_service.fastapi_service_sample.location
  service  = google_cloud_run_service.fastapi_service_sample.name

  role    = "roles/run.invoker"
  members = ["allUsers"]
}



output "service_url" {
  value = google_cloud_run_service.fastapi_service_sample.status[0].url
}



