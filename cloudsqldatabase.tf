resource "google_sql_database" "app_db" {

  name     = var.db_name
  instance = google_sql_database_instance.postgres.name

}

resource "google_sql_user" "app_user" {
  name     = var.db_user
  instance = google_sql_database_instance.postgres.name
  password = var.db_password

}