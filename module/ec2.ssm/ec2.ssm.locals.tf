
locals {
  
  ec2-ssm-name = "ec2_ssm-${var.environment}"
  ec2-ssm-role-name = "ec2@ssm-${var.environment}"
  ec2-ssm-profile-name = "ec2_ssm_profile-${var.environment}"
  
  instance-type = "t3.micro"
  Service-principal = "ec2.amazonaws.com"

  role-policy-ssm-arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}