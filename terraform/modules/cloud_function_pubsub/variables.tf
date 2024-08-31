variable "project_id" {
  description = "The ID of the project in which to create the function"
  type        = string
}

variable "bucket_name" {
  description = "Name of the storage bucket for function"
  type        = string
}

variable "function_name" {
  description = "Name of the Cloud Function"
  type        = string
}

#variable "source_directory" {
#  description = "Path to the directory containing the function code"
#  type        = string
#}

variable "pubsub_topic" {
  description = "Name of the Pub/Sub topic"
  type        = string
}

variable "service_account_email" {
  description = "Service account email to run the function"
  type        = string
}

