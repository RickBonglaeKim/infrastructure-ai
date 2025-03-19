
locals {
  alb-name = "${var.prefix}-${var.environment}"
  alb-type = "application"
  ssl-policy = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate-arn = "arn:aws:acm:ap-northeast-2:357079910360:certificate/76dd9434-863f-49d6-908c-af5d53404343"  

  alb-target_group-name = {
    sketch = "${var.prefix}-sketch-${var.environment}"
  }

}