
resource "aws_sqs_queue" "experience_ai_ppt_pitr" {
  name = local.experience-ai-ppt-pitr
  fifo_queue = true
}

data "aws_iam_policy_document" "allow__sqs_experience_ai_ppt_pitr" {
  statement {
    principals {
      type = "AWS"
      identifiers = [local.iam-ai]
    }
    effect = "Allow"
    actions = local.sqs-policy-actions
    resources = [
      aws_sqs_queue.experience_ai_ppt_pitr.arn
    ]
  }
}

resource "aws_sqs_queue_policy" "allow__sqs_experience_ai_ppt_pitr" {
  queue_url = aws_sqs_queue.experience_ai_ppt_pitr.url
  policy = data.aws_iam_policy_document.allow__sqs_experience_ai_ppt_pitr.json
}

