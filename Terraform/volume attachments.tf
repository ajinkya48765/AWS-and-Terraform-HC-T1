resource "aws_volume_attachment" "storage-attachment"{
  device_name   = "/dev/xvdh"
  volume_id     = "${aws_ebs_volume.storage.id}"
  instance_id   = "${aws_instance.webserver.id}"
}
