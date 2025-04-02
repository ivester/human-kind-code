# needed to allow SSH access
# e.g. gcloud compute ssh <node-name> --zone=europe-west3-c --project=human-kind-code
resource "google_compute_firewall" "allow_iap_ssh" {
  name    = "allow-iap-ssh"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["35.235.240.0/20"] // owned by Google LLC USA
}
