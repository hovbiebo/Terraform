#Decalre an environment variable
variable "region" {
 description = "The region in which the resources will reside"
 default = "us-east-2"
 type = string
 }

 variable "project_name" {
  description = "Project name"
   type = string
 }

 variable "environment" {
  description = "Environment name"
  type = string   
 }