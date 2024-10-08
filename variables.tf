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

 #VPC Variables 
 variable "vpc_cidr" {
description = "CIDR Block for the VPC"
type = string
 }
 variable "public_subnet_az1_cidr" {
description = "CIDR block for the public subnet in availability zone 1"
type =   string
 }

 variable "public_subnet_az2_cidr" {
description = "CIDR block for the public subnet in availability zone 2"
type =   string
 }

variable "private_app_subnet_az1_cidr" {
description = "CIDR block for the private app subnet in availability zone 1"
type =   string
 }

variable "private_app_subnet_az2_cidr" {
description = "CIDR block for the private app subnet in availability zone 2"
type =   string
 }

variable "private_data_subnet_az1_cidr" {
description = "CIDR block for the private data subnet in availability zone 1"
type =   string
 }


variable "private_data_subnet_az2_cidr" {
description = "CIDR block for the private data subnet in availability zone 2"
type =   string
 }

variable "Availability_Zone1" {
description = "Availability zone 1"
type =   string
 }

 variable "Availability_Zone2" {
description = "Availability zone 2"
type =   string
 }

 variable "security_groups" {
   description = "Availability zone 2"
   type =   string
 }