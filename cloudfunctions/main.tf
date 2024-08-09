resource "google_cloudfunctions_function" "verify_email_function" {
  name                  = "verify_email_function"
  description           = "Sends verification emails and tracks them in CloudSQL"
  runtime               = "nodejs20"
  available_memory_mb   = 256
  source_archive_bucket = var.function_source_bucket
  source_archive_object = var.function_source_object
  entry_point           = "verifyEmail"
  environment_variables = {
    CLOUD_SQL_USER        = var.db_user
    CLOUD_SQL_PASSWORD    = var.db_password
    CLOUD_SQL_DATABASE    = var.db_name
    CLOUD_SQL_INSTANCE    = var.db_host
    POSTMARK_FROM_EMAIL   = var.postmark_from_email
    GCP_PROJECT_ID        = var.project_id
    POSTMARK_API_KEY_SECRET = "projects/${var.project_id}/secrets/postmark-api-key/versions/latest"
    DOMAIN= var.domain
  }
  service_account_email = var.service_account_email
  event_trigger {
    event_type = "providers/cloud.pubsub/eventTypes/topic.publish"
    resource   = var.pubsub_topic
  }
}

resource "google_project_iam_member" "function_pubsub_invoker" {
  project = var.project_id
  role    = "roles/pubsub.subscriber"
  member  = "serviceAccount:${google_cloudfunctions_function.verify_email_function.service_account_email}"
}

resource "google_project_iam_member" "secretmanager_access" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${google_cloudfunctions_function.verify_email_function.service_account_email}"
}

resource "google_project_iam_member" "cloudsql_client" {
  project = var.project_id
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_cloudfunctions_function.verify_email_function.service_account_email}"
}

