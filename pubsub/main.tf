resource "google_pubsub_topic" "verify_email" {
  name = "verify_email"
}

resource "google_pubsub_subscription" "verify_email_subscription" {
  name  = "verify_email_subscription"
  topic = google_pubsub_topic.verify_email.name
}
