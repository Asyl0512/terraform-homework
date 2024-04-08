resource "aws_key_pair" "Bastion" {
  key_name   = "Bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "kaizen_yourname" {
  bucket = "kaizen-asyl"
}

resource "aws_s3_bucket" "kaizen_with_prefix" {
  bucket_prefix = "kaizen-"
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "kaizen-serik"
}

resource "aws_s3_bucket" "bucket2" {
  bucket = "kaizen-berik"
}

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
