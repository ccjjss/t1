variable "project_id" {
  description = "ID of the GCP project"
  type        = string
}

variable "region" {
  description = "Region for the GCP resources"
  type        = string
  default     = "us-central1"
}

variable "topic_name" {
  description = "Name of the Pub/Sub topic"
  type        = string
  default     = "latam-ingesta-topic"
}

variable "dataset_id" {
  description = "ID of the BigQuery dataset"
  type        = string
  default     = "latam_analytics_dataset"
}

variable "table_id" {
  description = "ID of the BigQuery table"
  type        = string
  default     = "latam_analytics_table"
}

variable "function_name" {
  description = "Name of the Cloud Function"
  type        = string
  default     = "latam-get-data-function"
}

variable "bucket_name" {
  description = "Name of the storage bucket for function"
  type        = string
  default     = "latam-functions-bucket"
}

variable "entry_point" {
  description = "Entry point for the Cloud Function"
  type        = string
  default     = "get_data"
}

variable "runtime" {
  description = "Runtime for the Cloud Function"
  type        = string
  default     = "python310"
}

variable "memory" {
  description = "Memory allocated to the Cloud Function"
  type        = number
  default     = 256
}

