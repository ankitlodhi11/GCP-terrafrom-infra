resource "google_storage_bucket_iam_member" "vm_bucket_access" {
  bucket = google_storage_bucket.app_bucket.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.vm_sa.email}"
}

resource "google_project_iam_member" "vm_cloudesql_client" {
  project = var.project_id
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.vm_sa.email}"
}
resource "google_storage_bucket" "app_bucket" {
  name     = var.bucket_name
  location = var.region

  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }

}
