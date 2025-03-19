
data "aws_iam_policy_document" "ssm-sketch" {
  statement {
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = [local.Service-principal]
    }
    actions = ["sts:AssumeRole"]
  }
}


resource "aws_iam_role" "ssm-sketch" {
  name = local.sketch-ssm-role-name
  assume_role_policy = data.aws_iam_policy_document.ssm-sketch.json

    tags = {
    Name = local.sketch-ssm-role-name
    Environment = var.environment
  }
}


resource "aws_iam_role_policy_attachment" "ssm-sketch" {
  role = aws_iam_role.ssm-sketch.name
  policy_arn = local.sketch-ssm-role-policy-arn
}


resource "aws_iam_instance_profile" "ssm-sketch" {
  name = local.sketch-ssm-profile-name
  role = aws_iam_role.ssm-sketch.name

  tags = {
    Name = local.sketch-ssm-profile-name
    Environment = var.environment
  }
}