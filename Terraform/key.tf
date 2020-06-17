resource "tls_private_key" "keygen" {
  algorithm   = "RSA"
}

resource "aws_key_pair" "sshkey111" {
  key_name   = "sshkey111"
  public_key = "${tls_private_key.keygen.public_key_openssh}"
}
