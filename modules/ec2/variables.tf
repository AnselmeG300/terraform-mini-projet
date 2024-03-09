variable "instance_type" {
  type = string
  description = "set aws instance type"
  default = "t4g.nano"
}

variable "security_groups" {
  type = set(string)
  default = null
}

variable "aws_common_tag" {
  type = map
  description = "Set aws tag"
  default = {
    Name = "ec2-eazytraining"
  }
}

variable "AZ" {
  type    = string
  default = "us-east-1b"
}