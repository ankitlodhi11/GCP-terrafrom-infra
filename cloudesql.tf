resource "google_sql_database_instance" "postgres" {
  name                = "${var.environment}-postgres"
  database_version    = "POSTGRES_16"
  region              = var.region
  deletion_protection = false
  settings {
    tier              = "db-custom-1-3840"
    availability_type = "ZONAL"
    disk_size         = 10
    disk_type         = "PD_SSD"
    disk_autoresize   = true
    edition           = "ENTERPRISE"
    backup_configuration {
      enabled                        = true
      point_in_time_recovery_enabled = true
    }
    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = google_compute_network.vpc_network.id
      enable_private_path_for_google_cloud_services = true
    }
    database_flags {
      name  = "cloudsql.iam_authentication"
      value = "on"
    }
  }
  depends_on = [google_compute_network.vpc_network, google_compute_subnetwork.subnet]
}