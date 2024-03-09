

data "aws_ami" "app_ami" {
  most_recent = true
  owners = [ "amazon" ]

  filter {
    name = "name"
    values = [ "*ubuntu-bionic*" ]
  }
}

resource "aws_key_pair" "deploy_key" {
  key_name   = "devops-anselme"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.deploy_key.key_name
  tags = var.aws_common_tag
  availability_zone = var.AZ
  security_groups = var.security_groups

  provisioner "remote-exec" {
    inline = [ 
      "sudo apt update -y",
      "sudo apt install -y nginx"
    ]

    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("./devops-anselme.pem")
      host = self.public_ip
    }
  }
}


