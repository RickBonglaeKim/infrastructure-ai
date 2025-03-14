resource "aws_security_group" "ec2_bastion_host" {
  name = local.security-group-ec2_bastion_host-name
  vpc_id = aws_vpc.this.id

  tags = {
    name = local.security-group-ec2_bastion_host-name
    environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow__from_i-screamArts__to__ec2_bastion_host" {
  security_group_id = aws_security_group.ec2_bastion_host.id
  cidr_ipv4 = local.i-screamArts-cidr
  from_port = 22
  ip_protocol = "tcp"
  to_port = 22
}

resource "aws_vpc_security_group_egress_rule" "allow__from_ec2_bastion_host__to__all" {
  security_group_id = aws_security_group.ec2_bastion_host.id
  cidr_ipv4 = local.all-cidr
  ip_protocol = "-1"
}