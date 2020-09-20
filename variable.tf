variable "vpc" {
  type = object({
    name           = string
    cidr           = string
    azs            = list(string)
    private_subnet = list(string)
  public_subnet = list(string) })
  description = "Collection of VPC creation variables"
}

variable "aws" {
  type = object({
    access_key = string,
    secret_key = string,
  region = string })
  description = "AWS Credentials"
}

variable "ec2" {
  type = object({
    name   = string
    ami    = string
    i_type = string
    k_name = string
  instance_count = number })
  description = "Collection of Ec2 creation variables"
}

variable "sg" {
  type = object({
    name = string
  ingress = list(string) })
  description = "Collection of Security Group creation variables"
}

