
output "subnet-database" {
  value = aws_subnet.database
}

output "subnet-private" {
  value = aws_subnet.private
}

output "subnet-public" {
  value = aws_subnet.public
}

output "security_group-ssm" {
  value = aws_security_group.ssm
}

output "security_group-ec2-sketch" {
  value = aws_security_group.ec2-sketch
}