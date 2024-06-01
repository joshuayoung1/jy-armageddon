# Public IP
output "External_IP" {
  value = google_compute_instance.vm.network_interface.0.access_config.0.nat_ip
}

# VPC
output "VPC" {
  value = google_compute_network.vpc1.name
}

# Subnet of the VM
output "Subnet" {
  value = google_compute_subnetwork.subnet.name
}

# Internal IP of the VM.
output "Internal_IP" {
  value = google_compute_instance.vm.network_interface.0.network_ip
}
