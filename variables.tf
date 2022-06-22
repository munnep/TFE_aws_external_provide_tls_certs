variable "tag_prefix" {
  description = "default prefix of names"
}

variable "region" {
  description = "region to create the environment"
}

variable "vpc_cidr" {
  description = "which private subnet do you want to use for the VPC. Subnet mask of /16"
}

variable "ami" {
  description = "Must be an Ubuntu image that is available in the region you choose"
}

variable "rds_password" {
  description = "password for the RDS postgres database user"
}

variable "public_key" {
  type        = string
  description = "public to use on the instances"
}

variable "tfe_password" {
  description = "password for tfe user"
}

variable "filename_license" {
  description = "filename of your license located under directory airgap"
}

variable "filename_server_key" {
  description = "filename of your TLS certificate key"
}

variable "filename_server_crt" {
  description = "filename of your TLS certificate"
}

variable "dns_hostname" {
  description = "DNS hostname"
}

variable "dns_zonename" {
  description = "DNS zonename"
}
