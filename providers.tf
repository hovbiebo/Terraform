#Configure AWS provider
provider "aws" {
region = var.region

default_tags {
  tags = {
    project = var.project_name
    environment = var.environment
    Automation = "Terraform"

  }
 }
}