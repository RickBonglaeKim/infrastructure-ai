
data "aws_iam_policy_document" "ec2_ssm" {
  statement {
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = [local.Service-principal]
    }
    actions = ["sts:AssumeRole"]
  }
}


resource "aws_iam_role" "ec2_ssm" {
  name = local.ec2-ssm-role-name
  assume_role_policy = data.aws_iam_policy_document.ec2_ssm.json

    tags = {
    name = local.ec2-ssm-role-name
    environment = var.environment
  }
}


resource "aws_iam_role_policy_attachment" "ec2_ssm" {
  role = aws_iam_role.ec2_ssm.name
  policy_arn = local.role-policy-ssm-arn
}


resource "aws_iam_instance_profile" "ssm" {
  name = local.ec2-ssm-profile-name
  role = aws_iam_role.ec2_ssm.name

  tags = {
    name = local.ec2-ssm-profile-name
    environment = var.environment
  }
}