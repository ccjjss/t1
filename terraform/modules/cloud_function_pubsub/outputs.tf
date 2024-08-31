output "function_name" {
  value = google_cloudfunctions_function.function_pubsub.name
}

output "function_https_trigger_url" {
  value = google_cloudfunctions_function.function_pubsub.https_trigger_url
}

