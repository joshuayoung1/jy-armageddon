# Create a publically accessuble web page with Terraform.
# You must complete the following
# 1) Terraform Script with a VPC
# 2) Terraform script must have a VM within your VPC.
# 3) The VM must have the homepage on it.
# 4) The VM must have an publically accessible link to it.
# 5) You must Git Push your script to your Github.
# 6) Output file must show 1) Public IP, 2) VPC, 3) Subnet of the VM, 4) Internal IP of the VM.

resource "google_compute_network" "vpc1" {
  project                 = var.project_id
  auto_create_subnetworks = false
  name                    = var.vpc1
  mtu                     = 1460
}

resource "google_compute_subnetwork" "subnet" {
  network       = google_compute_network.vpc1.name
  name          = var.sub1
  region        = var.region
  ip_cidr_range = var.ip_cidr_range
}

resource "google_compute_firewall" "task2-firewall" {
  name    = "task2-firewall"
  network = google_compute_network.vpc1.id


  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags   = ["http-server"]
  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
  depends_on    = [google_compute_network.vpc1]
}

resource "google_compute_instance" "vm" {
  name         = var.vm
  zone         = var.zone
  machine_type = "e2-micro"
  tags         = ["http-server", "https-server"] #public network tags


  metadata_startup_script = file("startup.sh")

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }
    queue_count = 0
    stack_type  = "IPV4_ONLY"

    network    = var.vpc1
    subnetwork = var.sub1
  }

  boot_disk {
    auto_delete = false
    initialize_params {
      image = "debian-12-bookworm-v20240415"
      size  = 10
      type  = "pd-standard"

    }

  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  depends_on = [
    google_compute_firewall.task2-firewall, google_compute_network.vpc1,
  google_compute_subnetwork.subnet]
}


