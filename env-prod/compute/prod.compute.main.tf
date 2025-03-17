
module "ec2_ssm" {
  source = "../../module/ec2.ssm"

  prefix = local.prefix
  environment = var.environment
}