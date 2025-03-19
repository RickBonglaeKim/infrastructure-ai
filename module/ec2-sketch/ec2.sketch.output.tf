
output "instance-1" {
  value = aws_instance.ec2-sketch[0]
}

output "instance-2" {
  value = aws_instance.ec2-sketch[1]
}