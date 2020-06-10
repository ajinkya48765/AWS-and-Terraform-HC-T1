provider "aws" {
	region = "ap-south-1"
	profile = "ajinkya"

}


resource "aws_security_group" "secg" {
  name        = "secg"
  description = "Httpd and ssh"
  vpc_id      = "vpc-38564a50"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "secg"
  }
}




resource "aws_ebs_volume" "storage" {
  availability_zone = "ap-south-1b"
  size              = 1
  tags = {
    Name = "storage"
  }
}

resource "aws_volume_attachment" "storage-attachment"{
  device_name   = "/dev/xvdh"
  volume_id     = "${aws_ebs_volume.storage.id}"
  instance_id   = "${aws_instance.webserver.id}"
}

resource "aws_instance" "webserver" {
  ami            =      "ami-0447a12f28fddb066"
  availability_zone = "ap-south-1b"
  instance_type  =      "t2.micro"
  key_name       =      "sshkey1111"
  security_groups=      [ "secg" ]
 
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

