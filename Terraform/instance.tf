resource "aws_instance" "webserver" {
  ami            =      "ami-0447a12f28fddb066"
  availability_zone = "ap-south-1b"
  instance_type  =      "t2.micro"
  key_name       =      "sshkey1111"
  security_groups=      [ "secg" ]
  iam_instance_profile = "${aws_iam_instance_profile.s3_profile.name}"

  user_data=<<-EOF
    #! /bin/bash
    sudo yum install httpd -y
    sudo systemctl start httpd 
    sudo systemctl enable httpd
    sudo mkfs -t ext4 /dev/xvdh
    sudo mount /dev/xvdh /var/www/html
    EOF

  tags = {
    Name = "webserver"
  }

}
