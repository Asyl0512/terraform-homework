# resource "aws_key_pair" "Bastion" {
#   key_name   = "Bastion-key"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLuX68O+bUUWYJmgC2bzdIc9CMChiTQ2lRrK+bRtWEdF9Xv6lyUvMrhvcb7eUQlzS2ez0iGh8vktPscTmYop39Lsi4Sa7Dg/xBIrUJ8fugBv1um6pWNFqLObCFHurNsr1kOehbwk/rnjNck4HauRsWdgvX4uRd1f3vLQpnwWKrLkto0dOowR7OV6AtvoucdmY2MsUqAKFDaxEA9w55ZegC9wVKcbAvifNSpzYDDSUEd75/wGdccjk5LYwdRQYbbtdIT+/o/b01xGSPBreEvtzA7fn1xGoZZHw2kqiAzOjCyNvKxL4uPYSHgOJ328omRp3EutMrUIog57myUMFcV2o/XMifj6nDIeLBYar03M6qQBS4g+VXoDanxmmk1OZyqPApHAVnMWIkO8qut3wY/Wi+c07ZPO7nM5RRWEMrQ8a1ybI6ZB2P6XA3m06DyaTF28LQuE7j5s8ZJB2vQP+iNQyBasd8+4YSLiwrRhdIUatJQgEna0hsfGRENtPKBEEunmE= user@Users-Air.lan"
# }

# resource "aws_s3_bucket" "bucket1" {
#   bucket = "kaizen-asyl"
# }

# resource "aws_s3_bucket" "bucket2" {
#   bucket = "kaizen-asel"
# }

# resource "aws_s3_bucket" "bucket3" {
#   bucket = "kaizen-serik"
# }

# resource "aws_s3_bucket" "bucket4" {
#   bucket = "kaizen-berik"
# }

# terraform import aws_s3_bucket.bucket3 kaizen-serik
# terraform import aws_s3_bucket.bucket4 kaizen-berik

resource "aws_iam_user" "users" {
  for_each = toset([
    "jenny",
    "rose",
    "lisa",
    "jisoo"
    ])
  name = each.key
}

resource "aws_iam_group" "blackpink" {
  name = "blackpink"
}

resource "aws_iam_group_membership" "blackpink" {
  name = "blackpink"

  users = [
     for i in aws_iam_user.users : i.name
    ]
  group = aws_iam_group.blackpink.name
}
