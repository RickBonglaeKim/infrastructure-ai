
module "postgres" {
  source = "../../module/rds.postgres"

  user-name = local.user-name
  user-password = local.user-password
  instance-class = local.instance-class
  storage-type = local.storage-type
  storage-size = local.storage-size

  environment = var.environment
}