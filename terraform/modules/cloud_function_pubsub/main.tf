resource "google_storage_bucket" "process-pubsub-bucket" {
  name          = var.bucket_name
  location      = var.location
  force_destroy = true
}

resource "google_cloudfunctions_function" "function_pubsub" {
  name        = var.function_name
  runtime     = "python310"
  entry_point = "process_pubsub_message"  
  source_archive_bucket = google_storage_bucket.process_pubsub_bucket.name
  source_archive_object = google_storage_bucket_object.function_zip.name  

  source_directory = var.source_directory


  trigger_topic = google_pubsub_topic.topic.name

  available_memory_mb   = 128
  timeout               = 60
#  service_account_email = var.service_account_email

  environment_variables = {
    PROJECT_ID = var.project_id
  }
}

resource "google_storage_bucket_object" "function_zip" {
  name   = "function-source.zip"
  bucket = google_storage_bucket.process_pubsub_bucket.name
  source = "../function/function-source.zip"
}

resource "google_pubsub_topic" "topic" {
  name = var.pubsub_topic
}



