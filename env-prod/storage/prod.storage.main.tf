
module "s3-sketch" {
  source = "../../module/s3.sketch"

  prefix = local.prefix
  environment = var.environment
  iam-sketch-arn = local.sketch-iam-arn
}

