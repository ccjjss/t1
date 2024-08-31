output "pubsub_topic" {
  value = module.pubsub.topic_name
}


output "bigquery_dataset" {
  value = module.bigquery.dataset_id
}


output "cloud_function_url" {
  value = module.cloud_function.function_url
}


output "cloud_function_pubsub_name" {
  value = module.cloud_function_pubsub.function_name
}

output "cloud_function_pubsub_url" {
  value = module.cloud_function_pubsub.function_https_trigger_url
}
