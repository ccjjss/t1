resource "google_bigquery_dataset" "latam_dataset" {
  dataset_id = var.dataset_id
  location   = var.location
}

resource "google_bigquery_table" "latam_table" {
  dataset_id = google_bigquery_dataset.latam_dataset.dataset_id
  table_id   = var.table_id
  schema     = var.schema
}

