resource "aws_lb" "ai" {
  name = local.alb-name
  internal = false
  load_balancer_type = local.alb-type
  enable_cross_zone_load_balancing = true
  security_groups = [data.terraform_remote_state.network.outputs.security_group-alb.id]
  subnets = [for subnet in data.terraform_remote_state.network.outputs.subnet-public : subnet.id]
  
  tags = {
    Name = local.alb-name
    Environment = var.environment
  }
}
