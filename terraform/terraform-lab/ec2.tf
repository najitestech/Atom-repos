#ec2.tf

provider "aws" {
  access_key = "${var.access_key}" 
  secret_key = "${var.secret_key}" 
  region     = "${var.region}" 
}

resource "aws_instance" "Ansible-server" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name = "Onajites45@"
  user_data = <<-EOF
              #!/bin/bash
              apt install apache2 -y
              apt install vim
              apt
              echo "Welcom to my first EC2 instance Web sever" > /var/www/html/index.html
              apt update -y
              service apache2 start
              EOF
}

resource "aws_instance" "jenkins-server" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name = "Onajites45@"
  user_data = <<-EOF
 	      #!/bin/bash
              apt update -y
              apt install nginx -y
              apt install vim -y
              EOF
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = ["pl-12c4e678"]
  }
}

