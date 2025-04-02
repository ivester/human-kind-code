locals {
  project_id = "human-kind-code"
  region     = "europe-west3"
  apis = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "containerregistry.googleapis.com",
    "logging.googleapis.com",
  ]
}
