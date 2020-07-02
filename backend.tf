terraform {
  backend "s3" {
    bucket = "dinoterrastate"
    key = "terraform/backend"
    region ="us-east-1"
  }
}
