output "pubsub_topic" {
  value = module.pubsub.topic_name
}


output "bigquery_dataset" {
  value = module.bigquery.dataset_id
}



output "cloud_function_url" {
  value = module.cloud_function.function_url
}

