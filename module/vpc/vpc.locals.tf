locals {

  vpc-name = "ai-${var.environment}"
  
  internet-gateway-name = "ai-${var.environment}"
  
  route-table-database-name = "ai-database-${var.environment}"
  route-table-private-name = "ai-private-${var.environment}"
  route-table-public-name = "ai-public-${var.environment}"

  security-group-postgres-name = "ai-postgres-${var.environment}"
  security-group-ec2_ssm-name = "ai-ssm-${var.environment}"
  security-group-ec2_bastion_host-name = "ai-bastion_host-${var.environment}"

  peer-vpc-id = "vpc-00cf7bafb1b875394"
  
  all-cidr = "0.0.0.0/0"
  i-screamArts-cidr = "1.212.63.210/32"
  default-vpc-cidr = "172.31.0.0/16"

  AZ-northeast-2 = {
    a = "ap-northeast-2a",
    b = "ap-northeast-2b",
    c = "ap-northeast-2c",
    d = "ap-northeast-2d"
  }
}