resource "google_compute_instance" "app_vm" {
  name         = var.vm_name
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2404-lts-amd64"
      size  = 30
      #   type  = pd-balanced
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {}
  }

  service_account {
    email  = google_service_account.vm_sa.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get install -y apache2 php libapache2-mod-php php-mysql
    systemctl enable apache2
    systemctl start apache2
    echo "<?php phpinfo(); ?>" > /var/www/html/index.php
  EOT

  tags = ["http-access", "https-access", "ssh-access"]

}