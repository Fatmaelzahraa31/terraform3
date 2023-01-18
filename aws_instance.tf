resource "aws_instance" "pinstance1" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = aws_subnet.pbsub1.id
    vpc_security_group_ids = [aws_security_group.sg1.id]
    key_name = "mykeypair"
  

  provisioner "local-exec" {
    command = "public ip $(aws_instance.pinstance1.public_ip) >> all-ips.txt"
  }

   provisioner "remote-exec" {
    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
    }
    inline = [
        #!/bin/bash
        "yum update -y" ,
        "yum install -y httpd" ,
        "systemctl start httpd" ,
        "systemctl enable httpd" ,
        "echo “Hello World from $(hostname -f) from the availability zone: $REGION_AV_ZONE” > /var/www/html/index.html"
    ]
  }
}

resource "aws_instance" "pinstance2" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = aws_subnet.pbsub2.id
    vpc_security_group_ids = [aws_security_group.sg2.id]
    key_name = "mykeypair"
  

  provisioner "local-exec" {
    command = "public ip $(aws_instance.pinstance1.public_ip) >> all-ips.txt"
  }

   provisioner "remote-exec" {
    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
    }
    inline = [
        #!/bin/bash
        "yum update -y" ,
        "yum install -y httpd" ,
        "systemctl start httpd" ,
        "systemctl enable httpd" ,
        "echo “Hello World from $(hostname -f) from the availability zone: $REGION_AV_ZONE” > /var/www/html/index.html"
    ]
  }
}
