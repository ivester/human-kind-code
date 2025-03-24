# TODO only needed to to access via SSH - maybe comment out for now and see if everything else works without it
resource "google_compute_firewall" "allow_iap_ssh" {
  name    = "allow-iap-ssh"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # TODO use public IP connected to GCP in Europe?
  source_ranges = ["35.235.240.0/20"] // owned by Google LLC USA
}
