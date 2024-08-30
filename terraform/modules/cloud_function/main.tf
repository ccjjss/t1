resource "google_storage_bucket" "latam_function_bucket" {
  name          = var.bucket_name
  location      = var.location
  force_destroy = true


}

resource "google_cloudfunctions_function" "latam_function" {
  name        = var.function_name
  runtime     = var.runtime
  entry_point = var.entry_point
  source_archive_bucket = google_storage_bucket.latam_function_bucket.name
  source_archive_object = google_storage_bucket_object.function_zip.name
  trigger_http = true
  available_memory_mb = var.memory

  environment_variables = {
    BIGQUERY_PROJECT = var.bigquery_project
  }
}

resource "google_storage_bucket_object" "function_zip" {
  name   = "function-source.zip"
  bucket = google_storage_bucket.latam_function_bucket.name
  source = "../function/function-source.zip"
}


