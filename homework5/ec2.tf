data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id      = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file ("apache.sh")
  tags = {
    Name = "Ubuntu"
  }

}

data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_instance" "amazon" {
  ami           = data.aws_ami.amzn-linux-2023-ami.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.private1.id
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file ("apache.amazon.sh")
  tags = {
    Name = "Amazon"
  }
}

output ec2_ubuntu {
  value = aws_instance.ubuntu.public_ip
}

output ec2_amazon {
  value = aws_instance.amazon.public_ip
}