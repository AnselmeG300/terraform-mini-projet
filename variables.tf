variable "region" {
  type = string
  description = "set aws region"
  default = "us-east-1"
}

variable "AZ" {
  type    = string
  default = "us-east-1b"
}

variable "size" {
  type    = number
  default = 100
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}