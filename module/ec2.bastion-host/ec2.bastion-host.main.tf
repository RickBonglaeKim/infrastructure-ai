
resource "aws_instance" "ec2_bastion_host" {
  ami = local.instance-ami
  instance_type = local.instance-type
  key_name = local.bastion_host-public_key-name
  vpc_security_group_ids = [data.terraform_remote_state.network.outputs.security-group-ec2_bastion_host.id]
  subnet_id = data.terraform_remote_state.network.outputs.subnet-public["c"].id
  associate_public_ip_address = true

  tags = {
    name = local.ec2-bastion_host-name
    environment = var.environment
  }
}