output "cloud_function_url" {
  description = "The URL of the deployed Cloud Function"
  value       = google_cloudfunctions_function.verify_email_function.https_trigger_url
}
