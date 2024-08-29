resource "google_pubsub_topic" "latam_topic" {
  name = var.topic_name
}

resource "google_pubsub_subscription" "latam_subscription" {
  name  = "${var.topic_name}-subscription"
  topic = google_pubsub_topic.latam_topic.name
}

