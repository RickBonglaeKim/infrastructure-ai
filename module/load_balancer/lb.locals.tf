
locals {
  alb-name = "${var.prefix}-${var.environment}"
  alb-type = "application"

  alb-target_group-name = {
    sketch = "${var.prefix}-sketch-${var.environment}"
  }

}