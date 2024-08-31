variable "dataset_id" {
  description = "ID of the BigQuery dataset"
  type        = string
}

variable "table_id" {
  description = "ID of the BigQuery table"
  type        = string
}

variable "schema" {
  description = "Schema for the BigQuery table"
  type        = string
  default     = <<EOF
  [
    {
      "name": "data_id",
      "type": "STRING",
      "mode": "REQUIRED"
    },
    {
      "name": "data_name",
      "type": "STRING",
      "mode": "REQUIRED"
    },    
    {
      "name": "data_value",
      "type": "FLOAT",
      "mode": "NULLABLE"
    }
  ]
  EOF
}

variable "location" {
  description = "Location for BigQuery resources"
  type        = string
  default     = "US"
}

