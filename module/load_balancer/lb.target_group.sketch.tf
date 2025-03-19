
resource "aws_lb_target_group" "sketch" {
  name = local.alb-target_group-name.sketch
  port = 7504
  protocol = "HTTP"
  vpc_id = data.terraform_remote_state.network.outputs.vpc.id
  
  health_check {
    path = "/alive"
  }

  tags = {
    Name = local.alb-target_group-name.sketch
    Environment = var.environment
  }
}


resource "aws_lb_target_group_attachment" "ec2-sketch-1" {
  target_group_arn = aws_lb_target_group.sketch.arn
  target_id = data.terraform_remote_state.compute.outputs.ec2-sketch-1.id
}

resource "aws_lb_target_group_attachment" "ec2-sketch-2" {
  target_group_arn = aws_lb_target_group.sketch.arn
  target_id = data.terraform_remote_state.compute.outputs.ec2-sketch-2.id
}