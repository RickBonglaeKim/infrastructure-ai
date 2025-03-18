
resource "aws_vpc_endpoint" "northeast_2-ssm" {
  vpc_id = aws_vpc.this.id
  service_name = "com.amazonaws.ap-northeast-2.ssm"
  vpc_endpoint_type = "Interface"
  security_group_ids = [
    aws_security_group.ssm.id
  ]
  private_dns_enabled = true

  tags = {
    Name = "${var.prefix}-endpoint-northeast_2-ssm-${var.environment}"
    Environment = "${var.environment}"
  }
}

resource "aws_vpc_endpoint" "northeast_2-ssmmessages" {
  vpc_id = aws_vpc.this.id
  service_name = "com.amazonaws.ap-northeast-2.ssmmessages"
  vpc_endpoint_type = "Interface"
  security_group_ids = [
    aws_security_group.ssm.id
  ]
  private_dns_enabled = true

  tags = {
    Name = "${var.prefix}-endpoint-northeast_2-ssmmessages-${var.environment}"
    Environment = "${var.environment}"
  }
}

resource "aws_vpc_endpoint" "northeast_2-ec2messages" {
  vpc_id = aws_vpc.this.id
  service_name = "com.amazonaws.ap-northeast-2.ec2messages"
  vpc_endpoint_type = "Interface"
  security_group_ids = [
    aws_security_group.ssm.id
  ]
  private_dns_enabled = true

  tags = {
    Name = "${var.prefix}-endpoint-northeast_2-ec2messages-${var.environment}"
    Environment = "${var.environment}"
  }
}