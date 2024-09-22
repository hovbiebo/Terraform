terraform {
  backend "s3" {
    bucket = "mobann-terraform-remote-state1"
    key = "mobann-app/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "terraform-state-lock"
  }
}