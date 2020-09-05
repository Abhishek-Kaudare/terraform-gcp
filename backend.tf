terraform {
  backend "gcs" {
    bucket = "abhishek-kaudare-21046-tfstate"
    prefix = "env/dev"
  }
}