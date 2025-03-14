
output "subnet-database" {
  value = aws_subnet.database
}

output "subnet-private" {
  value = aws_subnet.private
}

output "subnet-public" {
  value = aws_subnet.public
}

output "security-group-ec2_ssm" {
  value = aws_security_group.ec2_ssm
}