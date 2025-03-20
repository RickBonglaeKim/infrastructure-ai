locals {

  vpc-name = "${var.prefix}-${var.environment}"
  
  internet_gateway-name = "${var.prefix}-${var.environment}"
  nat_gateway-name = "${var.prefix}-${var.environment}"
  
  route_table-database-name = "${var.prefix}-database-${var.environment}"
  route_table-private-name = "${var.prefix}-private-${var.environment}"
  route_table-public-name = "${var.prefix}-public-${var.environment}"

  security_group-ec2-ssm-name = "${var.prefix}-ssm-${var.environment}"
  security_group-ec2-sketch-name = "${var.prefix}-sketch-${var.environment}"
  security_group-alb-name = "${var.prefix}-alb-${var.environment}"

  cidr = {
    all = "0.0.0.0/0"
    i-scream_arts = "1.212.63.210/32"
  }

  az-northeast-2 = {
    a = "ap-northeast-2a",
    b = "ap-northeast-2b",
    c = "ap-northeast-2c",
    d = "ap-northeast-2d"
  }

}