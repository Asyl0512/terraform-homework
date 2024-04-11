provider aws {
    region = var.region
}

resource "aws_instance" "web" {
  ami = var.ami_id
  instance_type = var.type
  key_name = var.key_name
  vpc_security_group_ids  = var.aws_security_group_ids
  count = var.count_number
  tags = local.common_tags
}

output instance_id {
  value = aws_instance.web.*.id
}