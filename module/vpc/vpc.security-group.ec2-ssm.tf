
resource "aws_security_group" "ec2_ssm" {
  name = local.security-group-ec2_ssm-name
  vpc_id = aws_vpc.this.id

  tags = {
    Name = local.security-group-ec2_ssm-name
    Environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow__from_i-screamArts__to__ec2_ssm" {
  security_group_id = aws_security_group.ec2_ssm.id
  cidr_ipv4 = local.i-screamArts-cidr
  from_port = 443
  ip_protocol = "tcp"
  to_port = 443
}

resource "aws_vpc_security_group_egress_rule" "allow__from_ec2_ssm__to__all" {
  security_group_id = aws_security_group.ec2_ssm.id
  cidr_ipv4 = local.all-cidr
  ip_protocol = "-1"
}