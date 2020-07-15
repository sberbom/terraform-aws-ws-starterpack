provider "aws" {
    region = "eu-north-1"
}

resource "aws_s3_bucket" "index13" {
  bucket = "index-bucket13"
  acl = "public"

  tags = {
    Name        = "Index bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_policy" "index13" {
  bucket = "${aws_s3_bucket.index13.id}"

  policy = templatefile("./policy/public_bucket.json.tpl",  {bucket_arn = "arn:aws:s3:::index-bucket13"})
}

resource "aws_s3_bucket" "code13" {
  bucket = "code-bucket13"
  acl = "public"

  tags = {
    Name        = "Code bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_policy" "code13" {
  bucket = "${aws_s3_bucket.code13.id}"

  policy = templatefile("./policy/public_bucket.json.tpl", {bucket_arn = "arn:aws:s3:::code-bucket13"})
}