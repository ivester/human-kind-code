resource "google_artifact_registry_repository" "docker_repo" {
  provider      = google
  project       = local.project_id
  location      = local.region
  repository_id = "hkc-docker-repo"
  format        = "DOCKER"

  docker_config {
    immutable_tags = false
  }
}
