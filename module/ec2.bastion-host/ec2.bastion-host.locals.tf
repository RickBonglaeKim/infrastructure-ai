
locals {
  ec2-bastion_host-name = "ec2_bastion_host-${var.environment}"
  bastion_host-public_key-name = "ai-school-bastion_host"         // Got from the key-pair on AWS.

  instance-ami = "ami-05a03364f8ca05a04"
  instance-type = "t4g.nano"
}