
resource "aws_instance" "ec2-sketch" {
  count = 2

  ami = local.sketch-ami
  instance_type = local.sketch-instance-type
  iam_instance_profile = aws_iam_instance_profile.ssm-sketch.name
  vpc_security_group_ids = [data.terraform_remote_state.network.outputs.security_group-ec2-sketch.id]
  subnet_id = data.terraform_remote_state.network.outputs.subnet-private[local.subnets[count.index]].id
  
  root_block_device {
    volume_size = 50
    volume_type = "gp3"
    iops = 3000
  }
  
  monitoring = true
  
  tags = {
    Name = "${var.prefix}-sketch_${count.index+1}-${var.environment}"
    Environment = var.environment
  }
  
}