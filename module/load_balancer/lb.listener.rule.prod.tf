
resource "aws_lb_listener_rule" "system-IDP-client-prod" {
  count = var.environment == "prod" ? 1 : 0    // Will be configured in dev environment.

  listener_arn = aws_lb_listener.ai-https.arn
  priority = 101

  condition {
    host_header {
      values = [ "ai-sketch.iscreamarts.com" ]
    }
  }  
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.sketch.arn
  }
}