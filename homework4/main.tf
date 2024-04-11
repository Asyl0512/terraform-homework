provider aws {
    region = var.region
}

resource "aws_instance" "web" {
  ami = var.ami_id
  instance_type = var.type
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  count = var.count_number
  tags = local.common_tags
}

output instance_id {
  value = aws_instance.web.*.id
}