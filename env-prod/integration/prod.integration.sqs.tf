
module "sqs" {
  source = "../../module/sqs"

  environment = var.environment
  iam = var.iam
}