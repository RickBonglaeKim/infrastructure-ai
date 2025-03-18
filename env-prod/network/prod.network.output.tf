
output "subnet-database" {
  value = module.vpc.subnet-database
}

output "subnet-private" {
  value = module.vpc.subnet-private
}

output "subnet-public" {
  value = module.vpc.subnet-public
}

output "security_group-ssm" {
  value = module.vpc.security_group-ssm
}

output "security_group-ec2-sketch" {
  value = module.vpc.security_group-ec2-sketch
}