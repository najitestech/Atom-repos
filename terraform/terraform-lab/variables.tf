variable "access_key" {
  default = "AKIAJY3IIM57ZH7KW6OA"
}
variable "secret_key" {
  default = "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"
}

variable "region" {
  default = "us-east-1"
}

variable "vpc_id" {
  default = "vpc-0a37db8eb5e13f15d"
}

output "public_ip" {
  value = "${aws_instance.Ansible-server.public_ip}"
}

output"id" {
  value = "${aws_instance.Ansible-server.id}"
}

output "public_dns" {
  value = "${aws_instance.Ansible-server.public_dns}"
}

output "subnet_id" {
  value = "${aws_instance.Ansible-server.subnet_id}"
}

output "network_interface_id" {
  value = "${aws_instance.Ansible-server.network_interface_id}"
}

output "instance_type" {
  value = "${aws_instance.Ansible-server.instance_type}"
}

output "security_groups" {
  value = "${aws_instance.Ansible-server.security_groups}"
}

