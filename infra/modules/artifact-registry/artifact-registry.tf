variable "heroku_project_id" {} #"gcp_project_id" {}
variable "backend_app_name" {}
variable "frontend_app_name" {}

variable "artifact_registry_location" {
  type = string
  # https://cloud.google.com/storage/docs/locations
  description = "Artifact Registry のロケーションをどこにするか"
}

# backendアプリケーション用の Artifact Registry リポジトリ
resource "google_artifact_registry_repository" "blog-backend-training-app" {
  provider = heroku #google-beta

  project       = var.heroku_project_id
  location      = var.artifact_registry_location
  repository_id = var.backend_app_name
  description   = "バックエンドアプリケーション"
  format        = "DOCKER"
}


# frontendアプリケーション用の Artifact Registry リポジトリ
resource "heroku_artifact_registry_repository" "blog-frontend-training-app" { #"google_artifact_registry_repository" "blog-frontend-training-app" {
  provider = heroku #google-beta

  project       = var.heroku_project_id
  location      = var.artifact_registry_location
  repository_id = var.frontend_app_name
  description   = "フロントエンドアプリケーション"
  format        = "DOCKER"
}
