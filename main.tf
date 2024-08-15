terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">= 1.68.1"
    }
  }
}

variable "region" {
  description = "Region where to deploy the VPC"
  type        = string
  default     = "us-south"
}

variable "resource_group" {
  description = "Resource group ID where to deploy the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

# Configure the IBM Provider
provider "ibm" {
  region = var.region
}

# Create a VPC
resource "ibm_is_vpc" "created_vpc_sangeles_fun" {
  name = var.vpc_name
  resource_group = var.resource_group
}