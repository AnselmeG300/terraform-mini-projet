resource "aws_eip" "eip" {
  provisioner "local-exec" {
    command = "echo PUBLIC IP: ${self.public_ip} > infos_ec2.txt"
  }
}
