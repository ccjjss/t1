variable "function_name" {
  description = "Name of the Cloud Function"
  type        = string
}

variable "bucket_name" {
  description = "Name of the storage bucket for function"
  type        = string
}

variable "entry_point" {
  description = "Entry point for the Cloud Function"
  type        = string
}

variable "runtime" {
  description = "Runtime for the Cloud Function"
  type        = string
}

variable "memory" {
  description = "Memory allocated to the Cloud Function"
  type        = number
}

variable "bigquery_project" {
  description = "GCP Project ID for BigQuery"
  type        = string
}

variable "location" {
  description = "Location for GCP resources"
  type        = string
  default     = "US"
}

