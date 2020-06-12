resource "aws_key_pair" "sshkey111" {
  key_name   = "sshkey111"
  public_key = "${file("key.txt")}"
}
