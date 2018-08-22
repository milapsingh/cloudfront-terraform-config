provider "aws" {
  region = "ap-south-1"
}

variable "bucket_name" {
  default = "XXXXXXXXXXXXXXXX"
}

variable "domain_name" {
  default = "Custom-s3-us-east-1.amazonaws.com"
}

variable "origin_id" {
  default = "Custom-s3-us-east-1.amazonaws.com"
}

variable "domain_name2" {
  default = "xxxxxxxxxxxxxxxxxxxxx"
}

variable "origin_id2" {
  default = "xxxxxxxxxxxxxxxxxxxxx"
}

variable "domain_name3" {
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

variable "origin_id3" {
  default = "xxxxxxxxxxxxxxxxxxxxxx"
}
