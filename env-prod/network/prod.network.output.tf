
output "subnet-database" {
  value = module.vpc.subnet-database
}

output "subnet-private" {
  value = module.vpc.subnet-private
}

output "subnet-public" {
  value = module.vpc.subnet-public
}

output "security-group-ec2_ssm" {
  value = module.vpc.security-group-ec2_ssm
}