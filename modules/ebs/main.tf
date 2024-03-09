resource "aws_ebs_volume" "ebs" {
  availability_zone = var.AZ
  size              = var.size
}
