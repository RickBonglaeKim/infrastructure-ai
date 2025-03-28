
resource "aws_security_group" "ec2-sketch" {
  name = local.security_group-ec2-sketch-name
  vpc_id = aws_vpc.this.id

  tags = {
    Name = local.security_group-ec2-sketch-name
    Environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "ec2-sketch-7504" {
  security_group_id = aws_security_group.ec2-sketch.id
  cidr_ipv4 = aws_vpc.this.cidr_block
  from_port = 7504
  ip_protocol = "tcp"
  to_port = 7504
}

resource "aws_vpc_security_group_egress_rule" "ec2-sketch-all" {
  security_group_id = aws_security_group.ec2-sketch.id
  cidr_ipv4 = local.cidr.all
  ip_protocol = "-1"
}