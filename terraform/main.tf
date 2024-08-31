provider "google" {
  project = var.project_id
  region  = var.region
}

module "pubsub" {
  source = "./modules/pubsub"
  topic_name = var.topic_name
}


module "bigquery" {
  source = "./modules/bigquery"
  dataset_id = var.dataset_id
  table_id   = var.table_id
}

module "cloud_function" {
  source          = "./modules/cloud_function"
  function_name   = var.function_name
  bucket_name     = var.bucket_name
  entry_point     = var.entry_point
  runtime         = var.runtime
  memory          = var.memory
  bigquery_project = var.project_id
}

module "cloud_function_pubsub" {
  source = "./modules/cloud_function_pubsub"

  project_id            = var.project_id
  function_name         = "process-pubsub-function"
  source_directory      = "${path.module}/../cloud_function_pubsub"
  pubsub_topic          = "latam-ingesta-topic"
  service_account_email = "primary1@berrysafetest-15c25.iam.gserviceaccount.com"
}

