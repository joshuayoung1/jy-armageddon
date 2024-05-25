# Create a publically accessible bucket in GCP with Terraform.  
# You must complete the following tasks:
# 1) Terraform script
# 2) Git Push the script to your Github
# 3) Output file must show the public link
# 4) Must have an index.html file within

resource "google_storage_bucket" "task1" {
  name                        = "${var.project_id}-task1"
  location                    = var.location
  force_destroy               = true
  uniform_bucket_level_access = false

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

resource "google_storage_bucket_object" "html" {
  name         = "index.html"
  source       = "index.html"
  content_type = "text/html"
  bucket       = google_storage_bucket.task1.id

}

resource "google_storage_bucket_object" "picture" {
  name   = "coffee.jpg"
  source = "coffee.jpg"
  bucket = google_storage_bucket.task1.id

}

resource "google_storage_bucket_access_control" "public_rule" {
  bucket = google_storage_bucket.task1.name
  role   = "READER"
  entity = "allUsers"
}

# All users to view files inside of bucket
resource "google_storage_bucket_iam_binding" "public_access" {
  bucket = google_storage_bucket.task1.name
  role   = "roles/storage.objectViewer"
  members = [
    "allUsers",
  ]
}
