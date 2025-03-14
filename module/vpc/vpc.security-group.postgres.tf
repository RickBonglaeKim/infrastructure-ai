
resource "aws_security_group" "postgres" {
  name = local.security-group-postgres-name
  vpc_id = aws_vpc.this.id

  tags = {
    name = local.security-group-postgres-name
    environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow__from_vpc__to__postgres" {
  security_group_id = aws_security_group.postgres.id
  cidr_ipv4 = aws_vpc.this.cidr_block
  from_port = 5432
  ip_protocol = "tcp"
  to_port = 5432
}

resource "aws_vpc_security_group_ingress_rule" "allow__form_default_vpc_cidr__to__postgres" {
  security_group_id = aws_security_group.postgres.id
  cidr_ipv4 = local.default-vpc-cidr
  from_port = 5432
  ip_protocol = "tcp"
  to_port = "5432"
}

resource "aws_vpc_security_group_egress_rule" "allow__from_postgres_ssm__to__all" {
  security_group_id = aws_security_group.postgres.id
  cidr_ipv4 = local.all-cidr
  ip_protocol = "-1"
}