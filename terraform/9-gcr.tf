resource "google_storage_bucket" "gcr_bucket" {
  name          = "${local.project_id}-gcr"
  location      = local.region
  project       = local.project_id
  force_destroy = true

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age = 365
    }
  }

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_member" "public_access" {
  bucket = google_storage_bucket.gcr_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}
