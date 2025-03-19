
resource "aws_security_group" "ssm" {
  name = local.security_group-ec2-ssm-name
  vpc_id = aws_vpc.this.id

  tags = {
    Name = local.security_group-ec2-ssm-name
    Environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssm-443" {
  security_group_id = aws_security_group.ssm.id
  cidr_ipv4 = aws_vpc.this.cidr_block
  from_port = 443
  ip_protocol = "tcp"
  to_port = 443
}

resource "aws_vpc_security_group_egress_rule" "ssm-all" {
  security_group_id = aws_security_group.ssm.id
  cidr_ipv4 = local.cidr.all
  ip_protocol = "-1"
}