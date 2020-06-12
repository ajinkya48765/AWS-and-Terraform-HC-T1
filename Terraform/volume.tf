resource "aws_ebs_volume" "storage" {
  availability_zone = "ap-south-1b"
  size              = 1
  tags = {
    Name = "storage"
  }
}
