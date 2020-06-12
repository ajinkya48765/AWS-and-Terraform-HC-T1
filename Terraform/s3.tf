resource "aws_s3_bucket" "bk2bk" {
  bucket = "bk2bk"
  acl    = "private"
  region = "ap-south-1"

  tags = {
    Name = "bk2bk"
  }
}
