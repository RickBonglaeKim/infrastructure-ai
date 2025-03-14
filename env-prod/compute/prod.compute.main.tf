
module "ec2_ssm" {
  source = "../../module/ec2.ssm"
  environment = var.environment
}

# module "ec2_bastion_host" {
#   source = "../../module/ec2.bastion-host"
#   environment = var.environment
# }