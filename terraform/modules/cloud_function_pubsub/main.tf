resource "google_cloudfunctions_function" "function_pubsub" {
  name        = var.function_name
  description = "Cloud Function triggered by Pub/Sub topic"
  runtime     = "python310"

  source_directory = var.source_directory

  entry_point = "process_pubsub_message"

  trigger_topic = google_pubsub_topic.topic.name

  available_memory_mb   = 128
  timeout               = 60
  service_account_email = var.service_account_email

  environment_variables = {
    PROJECT_ID = var.project_id
  }
}

resource "google_pubsub_topic" "topic" {
  name = var.pubsub_topic
}

