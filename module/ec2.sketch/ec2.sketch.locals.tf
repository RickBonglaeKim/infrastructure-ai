
locals {
  
  sketch-ami = "ami-062cddb9d94dcf95d"  // Amazon Linux 2023, 64-bit(x86), 2025-03-04
  sketch-instance-type = "t3.xlarge"

  Service-principal = "ec2.amazonaws.com"
  sketch-ssm-role-policy-arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  sketch-ssm-role-name = "${var.prefix}-ssm@sketch-${var.environment}"
  sketch-ssm-profile-name = "${var.prefix}-ssm@sketch-profile-${var.environment}"
  
  subnets = ["a", "b", "c"]

}