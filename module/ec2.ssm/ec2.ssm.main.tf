
data "aws_ami" "amazon_linux_2" {
  most_recent = true

  owners = ["amazon"]
  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}


resource "aws_instance" "ec2_ssm" {
  ami = data.aws_ami.amazon_linux_2.id
  instance_type = local.instance-type
  iam_instance_profile = aws_iam_instance_profile.ssm.name
  vpc_security_group_ids = [data.terraform_remote_state.network.outputs.security-group-ec2_ssm.id]
  subnet_id = data.terraform_remote_state.network.outputs.subnet-public["c"].id

  lifecycle {
    ignore_changes = [ami]
  }

  tags = {
    name = local.ec2-ssm-name
    environment = var.environment
  }
}