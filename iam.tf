resource "google_service_account" "vm_sa" {
  account_id   = "${var.environment}-vm-sa"
  display_name = "VM Service Account"

}