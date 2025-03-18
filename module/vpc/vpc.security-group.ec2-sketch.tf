
resource "aws_security_group" "ec2-sketch" {
  name = local.security_group-ec2-sketch-name
  vpc_id = aws_vpc.this.id

  tags = {
    Name = local.security_group-ec2-sketch-name
    Environment = var.environment
  }
}

resource "aws_vpc_security_group_egress_rule" "ec2-sketch-all" {
  security_group_id = aws_security_group.ec2-sketch.id
  cidr_ipv4 = local.cidr.all
  ip_protocol = "-1"
}