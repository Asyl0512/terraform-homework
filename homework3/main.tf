provider aws {
    region = "us-west-2"
}

data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amzn-linux-2023-ami.id
  instance_type = "t2.micro"
  associate_public_ip_address = "true"

  availability_zone = split(",", "us-west-2a,us-west-2b,us-west-2c")[count.index]

  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name = aws_key_pair.bastion.key_name
  count = 3
  user_data = file ("apache.sh")
  user_data_replace_on_change = true

  tags = merge(
    local.common_tags,
    {
      "Name" = "web-${count.index + 1}"
    },
  )
}


