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

# TODO do I need some kind of access config like this?
# resource "google_storage_bucket_iam_member" "public_access" {
#   bucket = google_storage_bucket.gcr_bucket.name
#   role   = "roles/storage.objectViewer"
#   member = "allUsers"
# }
