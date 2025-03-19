
module "vpc" {
  source = "../../module/vpc"

  prefix = local.prefix
  environment = var.environment

  vpc-cidr = local.vpc-cidr

  subnet-database = local.subnet-database
  subnet-private = local.subnet-private
  subnet-public = local.subnet-public

}


module "load_balancer" {
  source = "../../module/load_balancer"

  prefix = local.prefix
  environment = var.environment
}