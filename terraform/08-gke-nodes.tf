resource "google_service_account" "gke" {
  account_id = "hkc-gke"
}

resource "google_project_iam_member" "gke_logging" {
  project = local.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.gke.email}"
}

resource "google_project_iam_member" "gke_metrics" {
  project = local.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.gke.email}"
}

resource "google_project_iam_member" "gke_node_pool_artifact_registry" {
  project = "human-kind-code"
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.gke.email}"
}

resource "google_container_node_pool" "general" {
  name    = "general"
  cluster = google_container_cluster.gke.id

  # TODO is this needed, can this be configured through kubernetes yaml config? or is this for the plane nodes?
  autoscaling {
    total_min_node_count = 1
    total_max_node_count = 3
  }

  # TODO is this needed, can this be configured through kubernetes yaml config? or is this for the plane nodes?
  management {
    auto_repair  = true
    auto_upgrade = true
  }

  # TODO is this needed, can this be configured through kubernetes yaml config? or is this for the plane nodes?
  node_config {
    preemptible  = false
    machine_type = "e2-medium"

    labels = {
      role = "general"
    }

    service_account = google_service_account.gke.email
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]

    metadata = {
      "kubernetes-io-arch" = "amd64"
      "kubernetes-io-os"   = "linux"
    }
  }
}
