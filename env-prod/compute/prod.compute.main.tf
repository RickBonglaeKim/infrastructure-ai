
# module "ec2-ssm" {
#   source = "../../module/ec2.ssm"

#   prefix = local.prefix
#   environment = var.environment
# }

module "ec2-sketch" {
  source = "../../module/ec2.sketch"

  prefix = local.prefix
  environment = var.environment
}